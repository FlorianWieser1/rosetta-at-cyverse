#!/bin/bash

#     $assignations
echo "$0"   # prints the command e.g. ./test.sh
echo "$1"   # prints the first commandline argument
echo "$2"   # prints the second commandline argument
echo "$#"   # prints the number of commandline arguments
echo "$?"   # prints exit status (e.g. of command)
echo "$@"   # prints the list of all commandline arguments
echo "\$0"  # use blackslash to print the dollar singn w/o interpreting it 
echo "Usage: command - $0, argument 1 - $1, argument 2 - $2"

#     brackets
[ "a" = "a" ] # run a command, check $? if expression is true (0)
{ echo "a"; echo "b"; } # usually used to define arrays, but also useful for grouping output

echo "useful example script:"

_file="$1"

# if filename not supplied at the command prompt
# display usae message and die
[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }

echo "Script name: $0"
echo "\$1 = $1, so \$_file set to $1"

# if file not found, display an error and die
[ ! -f "$_file" ] && { echo "$0: $_file file not found."; exit 2; }

# if we are here, means everything is okay
echo "Processing $_file..."
