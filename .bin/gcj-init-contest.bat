@echo off
setlocal
set name=%~n0
set name=%name:-=_%

if not exist .\config\user_config.py (
  echo === mkdir config >&2
  if errorlevel 1 exit /b %errorlevel%
  mkdir config
  echo === copy "%~dp0gcj\config"\* config >&2
  copy "%~dp0gcj\config"\* config >nul
  if errorlevel 1 exit /b %errorlevel%
  )

if not exist .\config\current_config.py if not "%name%"=="gcj_init_contest" (
  echo Please run gcj-init-contest before %name%. >&2
  exit /b 2
  )

echo === python "%~dp0gcj\%name%.py" --base_dir . %* >&2
python "%~dp0gcj\%name%.py" --base_dir . %*

exit /b %errorlevel%