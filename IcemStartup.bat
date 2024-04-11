chcp 1251
@echo off

setlocal EnableDelayedExpansion

:: Getting all evironment variable strting with ICEMCFD_ROOT
set "count=0"
for /f "tokens=1,* delims==" %%a in ('set ICEMCFD_ROOT 2^>nul') do (
    set /a count+=1
    set "var[!count!]=%%a"
    set "val[!count!]=%%b"
)

IF %count% EQU 0 (
    echo ICEMCFD_ROOT not defined
	pause
    goto Exit	
) ELSE  IF %count% EQU 1 (	
	goto Icem1
) ELSE (	
	goto Icem2
)

:Icem1

:: Single variable ICEMCFD_ROOT:
echo !var[%count%]! = !val[%count%]!
set "selected_var=!var[%count%]!"
set "selected_val=!val[%count%]!"
goto IcemRun


:Icem2

:: Output to console list of all environment variable starting with ICEMCFD_ROOT
echo Select from list one of environment variable ICEMCFD_ROOT:
for /l %%i in (1,1,!count!) do (
	  echo [%%i] !var[%%i]!
)

:: Request from user number of environment variable
set /p choice=Enter number of environment variable: 

rem echo choice=%choice%

IF %choice% GTR %count% goto Error
IF %choice% LSS 1 goto Error  

:: Saving selected environment variable to new variable
set "selected_var=!var[%choice%]!"
set "selected_val=!val[%choice%]!"

:: Output to console selected variable
echo YOU select !selected_var! whith value !selected_val!

goto IcemRun


:IcemRun
set ICEMCFD_BAT=%selected_val%
echo 1 ICEMCFD_BAT=%ICEMCFD_BAT%

echo  "IcemStartup" cmd.exe /K ""%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0IcemStartup.tcl" "projectfile" %1"
:: pause 
start "IcemStartup" cmd.exe /K ""%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0IcemStartup.tcl" "projectfile" %1"

:: This way workable to.
rem start "IcemStartup" /D "%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\" icemcfd -script "%~dp0IcemStartup.tcl"
rem "%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0IcemStartup.tcl"

rem start "IcemStartup" "%ICEMCFD_BAT%" -script "%~dp0\IcemStartup.tcl"
rem "%ICEMCFD_BAT%" -script "%TCL_HOME%/IcemStartup/IcemStartup.tcl"

goto Exit

:Error
echo ERROR! Wrong number
pause

:Exit
exit
