# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

# Данный файл выполняется в графическом пространстве имен.

mmsg_start

proc loadInGuiSpace {} {
    # Добавлям пути в переменную PkgLoaderDirs пакета PkgLoader.
    PkgLoader::addSubDir ICEM
    PkgLoader::addDir MnasTkUtils
# Создаем файлы для загрузки пакетов по требованию.
    PkgLoader::createPkgIndex
# Загружаем пакеты
    package require MnasIcemUtils
    package require N70_base
    package require MnasTkUtils
    # Загружаем меню для WindowNavigator из пакета MnasTkUtils
    menu_MNAS
    menu_N70
    menu_WindowNavigator
}

loadInGuiSpace

mmsg_finish
