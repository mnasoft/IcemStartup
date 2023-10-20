# source $env(TCL_HOME)/IcemStartup/IcemStartup.tcl

mess "\nStart Loading IcemStartup.tcl ...\n"

global Tcl_User_Root
set Tcl_User_Root $env(TCL_HOME)

ic_gui_set eval source $Tcl_User_Root/PkgLoader/PkgLoader.tcl
ic_gui_set eval source $Tcl_User_Root/IcemStartup/IcemRequire.tcl

mess "\nIcemStartup.tcl - LOADED\n"

