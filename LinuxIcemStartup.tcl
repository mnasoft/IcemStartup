#source /_storage/otd11/namatv/dev/tcl/IcemStartup/LinuxIcemStartup.tcl

mess "Start Loading LinuxIcemStartup.tcl ...\n"

set tcl_user_root /_storage/otd11/namatv/dev/tcl
set auto_path
lappend auto_path $tcl_user_root/PkgLoader
package require PkgLoader
source $tcl_user_root/IcemStartup/IcemRequire.tcl

mess "LinuxIcemStartup.tcl - LOADED\n"

