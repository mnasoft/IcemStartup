# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

# Данный файл выполняется в графическом пространстве имен.

set DEBUG off; # Включение отладочных сообщений on (отключение off)

mmsg_start

proc loadInGuiSpace {} {
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
