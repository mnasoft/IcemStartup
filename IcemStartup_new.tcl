# source $env(TCL_HOME)/MnasIcemUtils/startup.tcl

mess "\nStart Loading IcemStartup.tcl\n"


set script_path [ file dirname [ file normalize [ info script ] ] ]
mess "\n\n"
#mess "$script_path \n"
global Tcl_User_Root

set Tcl_User_Root $script_path
ic_gui_set Tcl_User_Root $script_path

#ic_gui_set eval source "$Tcl_User_Root/PkgLoader/PkgLoader.tcl"
#source $Tcl_User_Root/PkgLoader/PkgLoader.tcl

# findFiles
# basedir - the directory to start looking in
# pattern - A pattern, as defined by the glob command, that the files must match
proc findFiles { basedir pattern } {

    # Fix the directory name, this ensures the directory name is in the
    # native format for the platform and contains a final directory seperator
    set basedir [string trimright [file join [file normalize $basedir] { }]]
    set fileList {}

    # Look in the current directory for matching files, -type {f r}
    # means ony readable normal files are looked at, -nocomplain stops
    # an error being thrown if the returned list is empty
    foreach fileName [glob -nocomplain -type {f r} -path $basedir $pattern] {
        lappend fileList $fileName
    }

    # Now look for any sub direcories in the current directory
    foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
        # Recusively call the routine on the sub directory and append any
        # new files to the results
        set subDirList [findFiles $dirName $pattern]
        if { [llength $subDirList] > 0 } {
            foreach subDirFile $subDirList {
                lappend fileList $subDirFile
            }
        }
    }
    return $fileList
 }
 
proc load_all_files {files} {
	global Tcl_User_Root
	foreach file $files {
		if { $file != "$Tcl_User_Root/IcemStartup.tcl" } {
			mess "  +++ $file +++\n"
			ic_gui_set eval source $file
		} else {
			mess "  --- $file --- \n"
		}
	}
}


load_all_files [ findFiles $Tcl_User_Root "*.tcl" ]
