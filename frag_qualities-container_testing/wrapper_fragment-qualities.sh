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

# Generate a chart of the fragment qualities using gnuplot 
gnuplot -e "set terminal png size 1000,750;
set title 'Fragment qualities' font ',20';
set ylabel 'RMSD [{\305}]' font ',16'; set ytics 0.1;
set xlabel 'Sequence length' font ',16'; set xtics 5;
set output 'fragment-qualities.png';
plot 'frag_qual.dat' u 2:4 w p lt rgb 'red' notitle"

# Post processing - move computational output to a "results"-folder
mkdir fragment-qualities_results

mv fragment-qualities.png /de-app-work/fragment-qualities_results
mv frag_qual.dat /de-app-work/fragment-qualities_results
