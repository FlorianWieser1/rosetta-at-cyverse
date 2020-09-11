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

input_pdb=$(find . -path ./database_complete -prune -false -o -name "*.pdb")
echo $input_pdb > input_pdb.txt

# Extract pdbs from silent.out (the subsequent contactMaps container requires silent.out as input)
/working_dir/extract_pdbs.static.linuxgccrelease -in:file:silent outfile.silent.o -database /de-app-work/database_complete


# Post processing - move computational output to a "results"-folder
# Rename computational output in order to be recognized by the subsequent containers (for workflow functionality)
mkdir abinitio_results

mv *.fsc /de-app-work/abinitio_results
mv *.pdb /de-app-work/abinitio_results
cp outfile.silent.o /de-app-work/abinitio_results

cd /de-app-work/abinitio_results
mkdir pdbs

mv *.pdb /de-app-work/abinitio_results/pdbs
mv /de-app-work/abinitio_results/pdbs/$input_pdb ../


# Sort results by best-scoring structure and compute a Score-vs-RMSD plot
cat score.fsc | (read -r; printf "%s\n" "$REPLY"; sort -n -k2 ) > score-sorted.fsc
/working_dir/score_scatter_plot.py --x_axis=score --y_axis=rms --silent=outfile.silent.o score-vs-rmsd.dat

#awk '{print $2 "\t" $14}' score-sorted.fsc | awk 'NR >1' > score-vs-rmsd.dat

# Generate a Rosetta energy vs RSMD scatter plot
python /working_dir/plot-score-vs-rmsd.py

rm score-vs-rmsd.dat
rm input_pdb.txt
