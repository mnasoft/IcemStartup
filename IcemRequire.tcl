# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

## * Команды [[file../IcemRequire.tcl]]
# Данный файл выполняется в графическом пространстве имен.

## ** Глобальные переменные - =DEBUG= :: Управляет выводом отладочных
## сообщений:

## - DEBUG = 1 (или on) - вывод отладочных сообщений в консоль
##   осуществляется;
## - DEBUG = 0 (или off) - вывод отладочных сообщений в консоль
##   не осуществляется;
set DEBUG off; 

mmsg_start

## - =loadInGuiSpace {}= :: Добавляет пути в переменую =auto_path= в
##   графическом пространстве имен ICEM CFD.
proc loadInGuiSpace {} {
    global auto_path
    dmsg "00012: $PkgLoader::Tcl_User_Root\n"
    lappend auto_path $PkgLoader::Tcl_User_Root/tooltip
    dmsg "00013: $auto_path\n"
    package require tooltip
    
    # Добавлям пути в переменную PkgLoaderDirs пакета PkgLoader.
    PkgLoader::addSubDir ICEM
    PkgLoader::addDir MnasTkUtils

    dmsg "000\n"

    # Создаем файлы для загрузки пакетов по требованию.
    PkgLoader::createPkgIndex
    dmsg "001\n"
    # Загружаем пакеты
    package require MnasIcemUtils
    package require N70_base
    package require MnasTkUtils

    dmsg "002\n"

    # Загружаем соответствующие меню
    menu_MNAS
    menu_N70
    menu_WindowNavigator
    
    dmsg "003\n"    
}
dmsg "004\n"
loadInGuiSpace
dmsg "005\n"

mmsg_finish
