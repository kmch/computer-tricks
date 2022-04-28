#!/usr/bin/env python

"""
Usage:
  name_of_the_script.py <file>...
  name_of_the_script.py (-h | --help)
  name_of_the_script.py --version

Options:
  -h --help     Show this screen.
  --version     Show version.
"""

# MODULES
from docopt import docopt
##

if __name__== '__main__':
  opts = docopt(__doc__, version = '1.0')
  print opts
  # CONVERT TO USABLE VARIABLE
  if opts['<file>']:
    file_names = opts['<file>'] # IT CONTAINS ALL THE FILES LISTED
else:
  eprint('This program must be run directly from a terminal\n')
  quit()
  
# MAIN
##