# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

mmsg_start

addRelToPkgLoaderDirs ICEM
addToPkgLoaderDirs MnasTkUtils

createPkgIndex

package require MnasIcemUtils
package require N70_base
package require MnasTkUtils

menu_WindowNavigator

mmsg_finish
