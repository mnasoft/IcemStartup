@echo off

@echo off
set ICEMCFD_BAT=%ICEMCFD_ROOT145%

setlocal enabledelayedexpansion
for %%i in ("%~dp0\..") do (
    set "parent_dir=%%~fi"
)
set "parent_dir=!parent_dir:\=/!"
endlocal & set "TCL_HOME=%parent_dir%"

start "IcemStartup" "%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0\IcemStartup.tcl"
