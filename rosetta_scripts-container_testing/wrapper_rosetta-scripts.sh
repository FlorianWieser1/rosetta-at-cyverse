#!/bin/bash

# Exit immediately if a non-zero status appears
set -e

APP_PATH="$(dirname $0)/rosetta_scripts.static.linuxgccrelease"

# In case no "flags" or "options"-file is provided, execute Rosetta with the command-line parameters provided in the CyVerse Discovery Environment
if [ -f "flags" ]
then
    $APP_PATH "@flags"
elif [ -f "options" ]
then
    $APP_PATH "@options"
else
    $APP_PATH "$@"
fi

# Post processing - move computational output to a "results"-folder
mkdir rosetta-scripts_results
mv *1.pdb /de-app-work/rosetta-scripts_results
mv *.sc /de-app-work/rosetta-scripts_results
