#!/bin/bash

# exit immediately if a non-zero status appears
set -e

APP_PATH="$(dirname $0)/AbinitioRelax.static.linuxgccrelease "

# In case no "flags" or "options"-file is provided, execute Rosetta with the command-line parameters provided in the CyVerse Discovery Environment
FLAGS=" @flags"
OPTIONS=" @options"

# Additional flags (unsupported in the CyVerse DE due to special characters):
SILENT_OUT=" -out:file:silent silent.o"

if [ -f "flags" ]
then
    $APP_PATH$FLAGS$SILENT_OUT
elif [ -f "options" ]
then
    $APP_PATH$OPTIONS$SILENT_OUT
else
    $APP_PATH$@$SILENT_OUT
fi

mv *.o outfile.silent.o

# Extract pdbs from silent.out (the subsequent contactMaps container requires silent.out as input)
/working_dir/extract_pdbs.static.linuxgccrelease -in:file:silent outfile.silent.o -database /de-app-work/database_complete

# Post processing - move computational output to a "results"-folder
# Rename computational output in order to be recognized by the subsequent containers (for workflow functionality)
mkdir abinitio_results

mv *.fsc /de-app-work/abinitio_results
mv *.pdb /de-app-work/abinitio_results
cp outfile.silent.o /de-app-work/abinitio_results
