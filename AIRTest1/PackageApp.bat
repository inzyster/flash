@echo off
set PAUSE_ERRORS=1
call bat\SetupSDK.bat
call bat\SetupApplication.bat

set AIR_TARGET=out/AIRTest1.exe
::set AIR_TARGET=-captive-runtime
set OPTIONS=-tsa none
call bat\Packager.bat

pause