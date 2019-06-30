@echo off

REM +--------------------------------------------------------------------+
REM |                                                                    |
REM |  Bld.bat                                                           |
REM |                                                                    |
REM +--------------------------------------------------------------------+

REM Set up build environment----------------------------------------------

ECHO [Bld.bat]: Establishing build environment

setlocal
set WATCOM=D:\WC
set PATH=%PATH%;%WATCOM%\BINW;%WATCOM%\BINNT
set EDPATH=%WATCOM%\EDDAT
set MAKEOPT=/h /s /f makefile.txt /ms
set TARGET=kdos.exe

REM Perform Build---------------------------------------------------------

ECHO [Bld.bat]: Invoking wmake.exe

REM Note: %~1 expands %1 and removes any surrounding quotation marks

IF "%~1" == "" (echo [Bld.bat]: Kdos.exe)&(wmake.exe %MAKEOPT% %TARGET%)&(GOTO end)
IF %1 == clean (echo [Bld.bat]: Clean)&(wmake.exe %MAKEOPT% %1)&(GOTO end)

:usage
ECHO [Bld.bat]: ********ERROR - BAD ARGUMENTS*********************
ECHO [Bld.bat]: USAGE: Bld.bat ^(clean^)
GOTO end

:end
ECHO [Bld.bat]: ERRORLEVEL= %ERRORLEVEL%

REM Restore Old Environment-----------------------------------------------

endlocal