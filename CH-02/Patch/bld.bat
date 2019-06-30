@echo off

REM +--------------------------------------------------------------------+
REM |                                                                    |
REM |  Bld.bat                                                           |
REM |                                                                    |
REM +--------------------------------------------------------------------+

REM Set up build environment----------------------------------------------

ECHO [Bld.bat]: Establishing build environment

setlocal
set PATH=%PATH%;C:\WinDDK\6000\bin\x86;C:\WinDDK\2003\bin\bin16
set MAKEOPT=/NOLOGO /f makefile.txt
set TARGET=PATCH.COM

REM Perform Build---------------------------------------------------------

ECHO [Bld.bat]: Invoking nmake.exe

REM Note: %~1 expands %1 and removes any surrounding quotation marks

IF "%~1" == "" (echo [Bld.bat]: %TARGET%)&(nmake.exe %MAKEOPT% %TARGET%)&(GOTO end)
IF %1 == clean (echo [Bld.bat]: Clean)&(nmake.exe %MAKEOPT% %1)&(GOTO end)

:usage
ECHO [Bld.bat]: ********ERROR - BAD ARGUMENTS*********************
ECHO [Bld.bat]: USAGE: Bld.bat ^(clean^)
GOTO end

:end
ECHO [Bld.bat]: ERRORLEVEL= %ERRORLEVEL%

REM Restore Old Environment-----------------------------------------------

endlocal