#!/bin/bash

# exit immediately if a non-zero status appears
set -e

APP_PATH="$(dirname $0)/contactMap.static.linuxgccrelease"

# Execute Rosetta's contactMaps protocol 
/working_dir/contactMap.static.linuxgccrelease -in:file:silent outfile.silent.o -silent_struct_type binary -database /de-app-work/database_complete

# Remove unneeded header lines
tail -n +4 *.csv | cut -f2- > outfile

# Generate contactMap plot
python /working_dir/plot-contactmap.py outfile

# Post processing - move computational output to a "results"-folder
mkdir contactMap_results
mv contact_map* /de-app-work/contactMap_results
