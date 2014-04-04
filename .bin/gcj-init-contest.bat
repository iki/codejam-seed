@echo off
setlocal
set name=%~n0
set name=%name:-=_%

if not exist .\config\user_config.py (
  echo === mkdir config
  if errorlevel 1 exit /b %errorlevel%
  mkdir config
  echo === copy .bin\gcj\config\* config
  copy "%~dp0gcj\config\*" config >nul
  if errorlevel 1 exit /b %errorlevel%
  )

if not exist .\config\current_config.py if not "%name%"=="gcj-init-contest" (
  echo === please run gcj-init-contest contest_id
  exit /b 2
  )

echo === python .bin\gcj\%name%.py --base_dir . %* 
python "%~dp0gcj\%name%.py" --base_dir . %*

exit /b %errorlevel%