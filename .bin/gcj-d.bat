@echo off
::| gcj-[abc] [cmd] [options]
::|   Runs solution to problem [abc].
::|

setlocal
set name=%~n0
set name=%name:gcj-=%
set opts=%*
set test=

::|   Processes any unsolved small/large input files.
::|

call :test small-0 %*
call :test small-1 %*
call :test small-2 %*
call :test small-3 %*
call :test small-attempt0 %*
call :test small-attempt1 %*
call :test small-attempt2 %*
call :test small-attempt3 %*
call :test small-practice %*
call :test small %*
call :test large %*
call :test large-0 %*
call :test large-1 %*
call :test large-2 %*
call :test large-3 %*
call :test large-practice %*

::|   Or simply runs the solution with passed options.
::|

if not defined test call :run %opts%

exit /b %errorlevel%

:test
::| test {input-name}
::|   Solves input if it exist, and output does not.
::|
::|   If corrent solution input-name.good exists,
::|   then output is compared.
::|
setlocal 
if "%~1"=="" exit /b 2
set test=%name%-%~1

if not exist "%test%.in" echo --- %1 >&2 && exit /b 1
if exist "%test%.out" echo +++ %1 >&2 && exit /b 3

call :run %opts% "%test%.in"

if exist "%test%.out" if exist "%test%.good" (
  echo === diff -w %test%.out %test%.good >&2
  diff -w "%test%.out" "%test%.good"
)

endlocal && set test=%test%
exit /b 0

:run
::| run [cmd] [options]
::|   Runs solution with passed options.
::|  

if exist "%name%.py" (
  set cmd=python "%name%.py"
) else if exist "%name%.js" (
  set cmd=node "%name%.js"
) else if exist "%name%.coffee" (
  set cmd=coffee "%name%.coffee"
) else if exist "%name%.rb" (
  set cmd=ruby "%name%.rb"
) else if exist "%name%" (
  set cmd=".\%name%" 
) else (
  set cmd=
)

echo === %cmd% %* >&2
call %cmd% %*
exit /b %errorlevel%
