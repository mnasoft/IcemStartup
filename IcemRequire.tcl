# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

# Данный файл выполняется в графическом пространстве имен.

mmsg_start

proc loadInGuiSpace {} {
    # Добавлям пути в переменную PkgLoaderDirs пакета PkgLoader.
    PkgLoader::addSubDir ICEM
    PkgLoader::addDir MnasTkUtils
    
    mmsg "000\n"

    # Создаем файлы для загрузки пакетов по требованию.
    PkgLoader::createPkgIndex
    mmsg "001\n"
    # Загружаем пакеты
    package require MnasIcemUtils
    package require N70_base
    package require MnasTkUtils

    mmsg "002\n"

    # Загружаем соответствующие меню
    menu_MNAS
    menu_N70
    menu_WindowNavigator
    
    mmsg "003\n"    
}
mmsg "004\n"
loadInGuiSpace
mmsg "005\n"

mmsg_finish
