# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

## * Команды [[file../IcemRequire.tcl]]
# Данный файл выполняется в графическом пространстве имен.

## ** Глобальные переменные - =DEBUG= :: Управляет выводом отладочных
## сообщений:

## - DEBUG = 1 (или on) - вывод отладочных сообщений в консоль
##   осуществляется;
## - DEBUG = 0 (или off) - вывод отладочных сообщений в консоль
##   не осуществляется;
set DEBUG on

mmsg_start

## - =loadInGuiSpace {}= :: Добавляет пути в переменую =auto_path= в
##   графическом пространстве имен ICEM CFD.
proc loadInGuiSpace {} {
    # Добавлям пути в глобальную переменную auto_path
    PkgLoader::add_Auto [PkgLoader::searchSubDir ICEM]
    PkgLoader::add_Auto [PkgLoader::abs_Path MnasTkUtils]
    PkgLoader::add_Auto [PkgLoader::abs_Path tooltip]
    # Создаем файлы для загрузки пакетов по требованию.
    if { [is_debug_on] == 1 } {
        # Добавлям пути в переменную PkgLoader::Dirs
        PkgLoader::add_Dirs [PkgLoader::abs_Path PkgLoader]
        PkgLoader::add_Dirs [PkgLoader::abs_Path MnasTkUtils]
        PkgLoader::add_Dirs [PkgLoader::searchSubDir ICEM]
        
        if {[catch { PkgLoader::i_pkg::create } err ]} {
            dmsg "*** ERROR: $err" } }
    # Загружаем пакет tooltip
    package require tooltip
    dmsg "loadInGuiSpace 006\n" 
    # Загружаем пакеты и меню
    package require MnasIcemUtils; menu_MNAS
    package require N70_base; menu_N70
    package require A32_base; menu_A32
    package require MnasTkUtils; menu_WindowNavigator
    dmsg "loadInGuiSpace 007: END\n"     
}

loadInGuiSpace

mmsg_finish

set DEBUG off; 
 
