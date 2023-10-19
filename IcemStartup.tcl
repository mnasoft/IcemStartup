# source $env(TCL_HOME)/MnasIcemUtils/startup.tcl

global Tcl_User_Root
set Tcl_User_Root $env(TCL_HOME)

mess "\n\n\n"
mess "=========================\n"
mess "source $Tcl_User_Root/PkgLoader/PkgLoader.tcl\n"
mess "=========================\n"
mess "package require MnasIcemUtils 1.0 \n"
mess "=========================\n"
mess "package require N70_base 1.0 \n"
mess "=========================\n"


