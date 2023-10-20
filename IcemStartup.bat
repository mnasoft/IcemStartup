@echo off

IF DEFINED "%ICEMCFD_ROOT145%" (
    set "ICEMCFD_BAT=%ICEMCFD_ROOT145%"
) ELSE IF DEFINED "%ICEMCFD_ROOT231%" (
    set "ICEMCFD_BAT=%ICEMCFD_ROOT231%"
)

setlocal enabledelayedexpansion
for %%i in ("%~dp0\..") do (
    set "parent_dir=%%~fi"
)
set "parent_dir=!parent_dir:\=/!"
endlocal & set "TCL_HOME=%parent_dir%"

echo  "%ICEMCFD_BAT% -script %TCL_HOME%/IcemStartup/IcemStartup.tcl"
pause 
rem start "IcemStartup" "%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0\IcemStartup.tcl"
rem start "IcemStartup" "%ICEMCFD_BAT%" -script "%~dp0\IcemStartup.tcl"
"%ICEMCFD_BAT%" -script "%TCL_HOME%/IcemStartup/IcemStartup.tcl"
