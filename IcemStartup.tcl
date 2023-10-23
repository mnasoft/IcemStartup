# source $env(TCL_HOME)/IcemStartup/IcemStartup.tcl

# Данный файл выполняется в скриптовом пространстве имен.

mess "Start Loading IcemStartup.tcl ...\n"

# getAncestorDir - процедура для определения абсолютного пути к
# каталогу-предку текущего файла TCL.
# level - уровень предка (0 для родительского каталога, 1 для дедушки
# и т.д.).
proc getAncestorDir {level} {
    # Получаем путь к текущему файлу
    set currentFile [info script]
    # Получаем путь к каталогу-предку
    set ancestorDir $currentFile
    for {set i 0} {$i <= $level} {incr i} {
        set ancestorDir [file dirname $ancestorDir]
    }
    # Возвращаем абсолютный путь к ancestorDir
    return [file normalize $ancestorDir]}

# Загружает некоторые файлы в графическое пространство имен.
proc loadToGuiSpace {} {
    set tcl_user_root [getAncestorDir 1]
    ic_gui_set eval source $tcl_user_root/PkgLoader/PkgLoader.tcl
    ic_gui_set eval source $tcl_user_root/IcemStartup/IcemRequire.tcl
}

loadInGuiSpace

mess "IcemStartup.tcl - LOADED\n"

