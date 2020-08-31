#!/bin/bash

# exit immediately if a non-zero status appears
set -e

APP_PATH="$(dirname $0)/r_frag_quality.static.linuxgccrelease"

# In case on "flags" or "options"-file is provided, execute Rosetta with the command-line parameters provided in the CyVerse Discovery Environment
if [ -f "flags" ]
then
    $APP_PATH "@flags"
elif [ -f "options" ]
then
    $APP_PATH "@options"
else
    $APP_PATH "$@"
fi

# Generate a chart of the fragment qualities using matplotlib
python /working_dir/plot-fragment-qualities.py

# Post processing - move computational output to a "results"-folder
mkdir fragment-qualities_results

mv Fragment-qualities.png /de-app-work/fragment-qualities_results
mv frag_qual.dat /de-app-work/fragment-qualities_results
