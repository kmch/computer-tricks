# BUILT ONLY target1
make target1
##

# If the -j option is given without an
# argument, make will not limit the number of jobs that can run simultaneously.
make -j 
#


# RUN MAKE IN A NON-LOCAL DIRECTORY
make -C path/to/where/to/run/make 
##

#
-c # means "compile the program without generating an executable." OUTPUT (USUALLY) .o file
##

# THE ORDER OF MODULES IN THE LIST 'SRC' MATTERS!!!!!!!!!!!!!
# IF WRONG, YOU MAY GET THE ERROR:
Fatal Error: Cant open module file 'MODULE_NAME.mod' for reading at (1): No such file or directory
##

#
#There seems to have been a change in the way the linkers work — at some time, it was possible to specify shared libraries 
#(such as the maths library) 
#before the object files, and all would work. However, nowadays, if the shared library doesn't satisfy any symbols when 
#it is scanned, 
#it is omitted from the link process. Ensuring that the object files are listed before the libraries fixes this.
#So:

##