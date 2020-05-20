#!/bin/bash

# exit immediately if a non-zero status appears
set -e

# execute rosetta protocol
APP_PATH="$(dirname $0)/AbinitioRelax.static.linuxgccrelease"
$APP_PATH "$@"

# extract pdbs from silent.out
/working_dir/extract_pdbs.static.linuxgccrelease -in:file:silent outfile.silent.o -database /de-app-work/database_complete

# post processing
mkdir abinitio_results

mv *.fsc /de-app-work/abinitio_results
mv *.pdb /de-app-work/abinitio_results
cp outfile.silent.o /de-app-work/abinitio_results
