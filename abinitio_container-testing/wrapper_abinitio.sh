#!/bin/bash

# exit immediately if a non-zero status appears
set -e

APP_PATH="$(dirname $0)/AbinitioRelax.static.linuxgccrelease"

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

# Extract pdbs from silent.out (the subsequent contactMaps container requires silent.out as input)
/working_dir/extract_pdbs.static.linuxgccrelease -in:file:silent outfile.silent.o -database /de-app-work/database_complete

# Post processing - move computational output to a "results"-folder
# Rename computational output in order to be recognized by the subsequent containers (for use in workflows)
mkdir abinitio_results

mv *.fsc /de-app-work/abinitio_results
mv *.pdb /de-app-work/abinitio_results
cp outfile.silent.o /de-app-work/abinitio_results
