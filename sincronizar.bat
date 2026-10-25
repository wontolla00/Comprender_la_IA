@echo off
setlocal EnableDelayedExpansion
REM Doble clic en Windows: sincroniza este repositorio (Comprender_la_IA) con GitHub.
REM Pasos: comprueba que no hay cambios sin commitear en archivos seguidos, trae lo nuevo
REM del remoto (solo avance rapido), te ensena los commits que va a subir, te pide
REM confirmacion (el CLAUDE.md del repo dice que no se publica sin que el autor lo pida)
REM y hace el push. La ventana queda abierta para leer el resultado.
cd /d "%~dp0"

where git >nul 2>nul
if errorlevel 1 (
  echo No encuentro git en el PATH. Instala Git for Windows o abre Git Bash aqui.
  set "CODE=2"
  goto :fin
)

for /f "delims=" %%B in ('git branch --show-current') do set "BRANCH=%%B"
if "%BRANCH%"=="" (
  echo No hay rama activa ^(HEAD suelto^). Cambia a una rama y vuelve a ejecutar.
  set "CODE=2"
  goto :fin
)
echo Repositorio: %CD%
echo Rama: %BRANCH%
echo.

REM 1. Cambios sin commitear en archivos seguidos (los archivos nuevos sin seguir no bloquean).
git diff --quiet
set "D1=%ERRORLEVEL%"
git diff --cached --quiet
set "D2=%ERRORLEVEL%"
if not "%D1%%D2%"=="00" (
  echo HAY CAMBIOS SIN COMMITEAR en archivos seguidos:
  git status --short --untracked-files=no
  echo Haz commit ^(o descartalos^) y vuelve a ejecutar.
  set "CODE=1"
  goto :fin
)
for /f %%N in ('git ls-files --others --exclude-standard ^| find /c /v ""') do set "UNTRACKED=%%N"
if not "%UNTRACKED%"=="0" (
  echo Aviso: hay %UNTRACKED% archivo^(s^) nuevos sin seguir; no se suben. Ver con: git status
  echo.
)

REM 2. Traer lo nuevo del remoto.
echo Comprobando el remoto...
git fetch origin
if errorlevel 1 (
  echo No se pudo contactar con GitHub ^(red o credenciales^).
  set "CODE=2"
  goto :fin
)
for /f %%N in ('git rev-list --count HEAD..origin/%BRANCH%') do set "BEHIND=%%N"
for /f %%N in ('git rev-list --count origin/%BRANCH%..HEAD') do set "AHEAD=%%N"
echo Por delante del remoto: %AHEAD% commit^(s^)   Por detras: %BEHIND% commit^(s^)
echo.

if not "%BEHIND%"=="0" (
  if not "%AHEAD%"=="0" (
    echo HISTORIA DIVERGIDA: hay commits locales y remotos distintos. No se toca nada.
    echo Resuelvelo a mano ^(git pull --rebase, o pide ayuda^).
    set "CODE=4"
    goto :fin
  )
  echo Bajando cambios del remoto ^(solo avance rapido^)...
  git merge --ff-only origin/%BRANCH%
  if errorlevel 1 (
    set "CODE=5"
    goto :fin
  )
  echo Sincronizado: solo habia que bajar cambios.
  set "CODE=0"
  goto :fin
)

if "%AHEAD%"=="0" (
  echo Ya esta sincronizado: no hay nada que subir.
  set "CODE=0"
  goto :fin
)

REM 3. Ensenar lo que se va a subir y pedir confirmacion.
echo Commits que se van a subir:
git log origin/%BRANCH%..HEAD --oneline
echo.
echo Archivos tocados:
git diff --stat origin/%BRANCH%..HEAD
echo.
set /p "OK=Subir estos commits a GitHub? (s/N): "
if /i not "%OK%"=="s" (
  echo Cancelado. No se ha subido nada.
  set "CODE=6"
  goto :fin
)

git push origin %BRANCH%
if errorlevel 1 (
  echo.
  echo El push ha fallado. Revisa el mensaje de arriba ^(credenciales o permisos^).
  set "CODE=2"
  goto :fin
)
echo.
echo Sincronizado.
set "CODE=0"

:fin
echo.
echo ------------------------------------------------------------
echo Codigo de salida: %CODE%   ^(0 = sincronizado^)
echo   1 cambios sin commitear   2 red, credenciales o git   4 historia divergida
echo   5 no se pudo avanzar    6 cancelado por ti
echo ------------------------------------------------------------
pause
exit /b %CODE%
