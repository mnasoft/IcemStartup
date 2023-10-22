# source $env(TCL_HOME)/IcemStartup/IcemRequire.tcl

mmsg_start

addRelToPkgLoaderDirs ICEM
createPkgIndex

package require MnasIcemUtils
package require N70_base

mmsg_finish
