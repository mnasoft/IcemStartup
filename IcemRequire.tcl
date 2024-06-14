# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

## * Команды [[file../IcemRequire.tcl]]
# Данный файл выполняется в графическом пространстве имен.

## ** Глобальные переменные - =DEBUG= :: Управляет выводом отладочных
## сообщений:

## - DEBUG = 1 (или on) - вывод отладочных сообщений в консоль
##   осуществляется;
## - DEBUG = 0 (или off) - вывод отладочных сообщений в консоль
##   не осуществляется;
set DEBUG off

mmsg_start

## - =loadInGuiSpace {}= :: Добавляет пути в переменую =auto_path= в
##   графическом пространстве имен ICEM CFD.
proc loadInGuiSpace {} {
    dmsg "loadInGuiSpace 000: START\n"
    global auto_path
    dmsg "loadInGuiSpace 003\n" 
    # Добавлям пути в переменную PkgLoaderDirs пакета PkgLoader.
    PkgLoader::addSubDir ICEM
    PkgLoader::addDir MnasTkUtils
    PkgLoader::addDir tooltip
    dmsg "loadInGuiSpace 004\n"
    # Добавляем содержимое переменной PkgLoader::Dirs в переменную auto_path
    PkgLoader::addToAutoPath $PkgLoader::Dirs 
    # Создаем файлы для загрузки пакетов по требованию.
    if { [is_debug_on] == 1 } {
    dmsg "loadInGuiSpace 006: PkgLoader::createPkgIndex\n"         
        PkgLoader::createPkgIndex }
    dmsg "loadInGuiSpace 005\n" 
    # Загружаем пакеты
    package require tooltip
    package require MnasIcemUtils
    package require N70_base
    package require MnasTkUtils
    dmsg "loadInGuiSpace 006\n" 
    # Загружаем соответствующие меню
    menu_MNAS
    menu_N70
    menu_WindowNavigator
    dmsg "loadInGuiSpace 007: END\n"     
}
dmsg "IcemRequire.tcl 000: START\n"
loadInGuiSpace
dmsg "IcemRequire.tcl 001: END\n"
mmsg_finish

set DEBUG off; 
