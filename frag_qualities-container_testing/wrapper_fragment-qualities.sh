#!/bin/bash

# exit immediately if a non-zero status appears
set -e

# execute rosetta protcol
APP_PATH="$(dirname $0)/r_frag_quality.static.linuxgccrelease"
$APP_PATH "$@"

# plot fragment qualities 
gnuplot -e "set terminal png size 1000,750;
set title 'Fragment qualities' font ',20';
set ylabel 'RMSD [{\305}]' font ',16'; set ytics 0.1;
set xlabel 'Sequence length' font ',16'; set xtics 5;
set output 'fragment-qualities.png';
plot 'frag_qual.dat' u 2:4 w p lt rgb 'red' notitle"

# post processing
mkdir fragment-qualities_results

mv fragment-qualities.png /de-app-work/fragment-qualities_results
mv frag_qual.dat /de-app-work/fragment-qualities_results
