#!/bin/bash

# Exit immediately if a non-zero status appears
set -e

# execute rosetta protocol
APP_PATH="$(dirname $0)/fragment_picker.static.linuxgccrelease"
$APP_PATH "$@"

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
mkdir fragment-picker_results

mv *.pdb /de-app-work/fragment-picker_results
mv frags.fsc* /de-app-work/fragment-picker_results

cp frags*3mers outfile.200.3mers
cp frags*9mers outfile.200.9mers

mv frags* /de-app-work/fragment-picker_results
cp /de-app-work/fragment-picker_results/*.pdb /de-app-work/outfile.pdb
