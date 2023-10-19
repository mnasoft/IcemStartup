@echo off

@echo off
setlocal enabledelayedexpansion
for %%i in ("%~dp0\..") do (
    set "parent_dir=%%~fi"
)
set "parent_dir=!parent_dir:\=/!"
endlocal & set "TCL_HOME=%parent_dir%"

start "IcemStartup" "%ICEMCFD_BAT%" -script %TCL_HOME%/IcemStartup/IcemStartup.tcl

