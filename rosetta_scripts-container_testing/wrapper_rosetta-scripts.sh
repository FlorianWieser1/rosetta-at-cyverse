#!/bin/bash

# exit immediately if a non-zero status appears
set -e

APP_PATH="$(dirname $0)/rosetta_scripts.static.linuxgccrelease"

filename="flags"

# execute rosetta_scripts with flags if a flags-file was given, else use command-line parameters

if [ -f "$filename" ]
then
        $APP_PATH "@flags"
else
        $APP_PATH "$@"
fi

# post processing
mkdir rosetta-scripts_results

mv *.pdb /de-app-work/rosetta-scripts_results
mv *.sc /de-app-work/rosetta-scripts_results
