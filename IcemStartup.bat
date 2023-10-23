@echo off

setlocal EnableDelayedExpansion

:: Получить все переменные окружения, начинающиеся с ICEMCFD_ROOT
set "count=0"
for /f "tokens=1,* delims==" %%a in ('set ICEMCFD_ROOT 2^>nul') do (
    set /a count+=1
    set "var[!count!]=%%a"
    set "val[!count!]=%%b"
)

IF %count% EQU 0 (
    echo ICEMCFD_ROOT не определена
	pause
    goto Exit	
) ELSE  IF %count% EQU 1 (	
	goto Icem1
) ELSE (	
	goto Icem2
)


:Icem1

echo ICEMCFD_ROOT одна:
echo !var[%count%]! = !val[%count%]!
set "selected_var=!var[%count%]!"
set "selected_val=!val[%count%]!"
goto IcemRun


:Icem2

:: Вывести список переменных окружения
echo Выберите одну из переменных окружения ICEMCFD_ROOT:
for /l %%i in (1,1,!count!) do (
	  echo [%%i] !var[%%i]!
)

:: Запросить у пользователя выбор переменной окружения
set /p choice=Введите номер переменной окружения: 

rem echo choice=%choice%

IF %choice% GTR %count% goto Error
IF %choice% LSS 1 goto Error  

:: Сохранить выбранную переменную окружения в новую переменную
set "selected_var=!var[%choice%]!"
set "selected_val=!val[%choice%]!"

:: Вывести выбранную переменную окружения
echo Вы выбрали !selected_var! со значением !selected_val!

goto IcemRun


:IcemRun
set ICEMCFD_BAT=%selected_val%
echo 1 ICEMCFD_BAT=%ICEMCFD_BAT%

echo  "IcemStartup" cmd.exe /K ""%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0IcemStartup.tcl""
pause 
start "IcemStartup" cmd.exe /K ""%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0IcemStartup.tcl""

:: Так тоже работает
rem start "IcemStartup" /D "%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\" icemcfd -script "%~dp0IcemStartup.tcl"
rem "%ICEMCFD_BAT%\%ICEMCFD_SYSDIR%\bin\icemcfd" -script "%~dp0IcemStartup.tcl"

rem start "IcemStartup" "%ICEMCFD_BAT%" -script "%~dp0\IcemStartup.tcl"
rem "%ICEMCFD_BAT%" -script "%TCL_HOME%/IcemStartup/IcemStartup.tcl"

goto Exit

:Error
echo Ошибка! Неправильно выбран номер
pause

:Exit
exit
