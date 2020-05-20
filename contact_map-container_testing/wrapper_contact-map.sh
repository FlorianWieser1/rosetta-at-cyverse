#!/bin/bash

# exit immediately if a non-zero status appears
set -e

# execute rosetta protocol
APP_PATH="$(dirname $0)/contactMap.static.linuxgccrelease"
$APP_PATH "$@"

# extract pdbs from silent.out
/working_dir/contactMap.static.linuxgccrelease -in:file:silent outfile.silent.o -silent_struct_type binary -database /de-app-work/database_complete

tail -n +4 *.csv | cut -f2- > outfile

python /working_dir/plot-contactmap.py outfile

# post processing
mkdir contactMap_results

mv contact_map* /de-app-work/contactMap_results
