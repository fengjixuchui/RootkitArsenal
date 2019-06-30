@echo off

REM +--------------------------------------------------------------------+
REM |                                                                    |
REM |  Bld.bat                                                           |
REM |                                                                    |
REM +--------------------------------------------------------------------+

REM Set up build environment----------------------------------------------

ECHO [Bld.bat]: Establishing build environment

setlocal
set PATH=%PATH%;D:\MASM611\BIN;D:\MASM611\BINR
set MAKEOPT=/NOLOGO /f makefile.txt
set TARGET=BBootkit.COM

REM Perform Build---------------------------------------------------------

ML /nologo /AT /FlBBOOTKIT.txt /FoBBOOTKIT.obj BBOOTKIT.asm /link /NOLOGO
ECHO [Bld.bat]: ERRORLEVEL= %ERRORLEVEL%
PadImage BBOOTKIT.com

REM Restore Old Environment-----------------------------------------------

endlocal