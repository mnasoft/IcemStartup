# source $env(TCL_HOME)/MnasIcemUtils/startup.tcl

mess "\nStart Loading IcemStartup.tcl ...\n"

global Tcl_User_Root
set Tcl_User_Root $env(TCL_HOME)

ic_gui_set eval source $Tcl_User_Root/PkgLoader/PkgLoader.tcl

mess "\nIcemStartup.tcl - LOADED\n"

