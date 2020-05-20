#!/bin/bash

# exit immediately if a non-zero status appears
set -e


# execute rosetta protocol
APP_PATH="$(dirname $0)/fragment_picker.static.linuxgccrelease"
$APP_PATH "$@"

# post processing
mkdir fragment-picker_results

mv *.pdb /de-app-work/fragment-picker_results
mv frags.fsc* /de-app-work/fragment-picker_results

cp frags*3mers outfile.200.3mers
cp frags*9mers outfile.200.9mers

mv frags* /de-app-work/fragment-picker_results
cp /de-app-work/fragment-picker_results/*.pdb /de-app-work/outfile.pdb
