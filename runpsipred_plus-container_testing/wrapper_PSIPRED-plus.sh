#!/bin/bash

runpsipredplus *.fasta

rm -f psitmp*

mkdir psipred-plus_results

mv *.ss /de-app-work/psipred-plus_results/
mv *.horiz /de-app-work/psipred-plus_results/
cp *.ss2 /de-app-work/psipred-plus_results/

mv *.ss2 outfile.ss2
mv *.fasta outfile.fasta
