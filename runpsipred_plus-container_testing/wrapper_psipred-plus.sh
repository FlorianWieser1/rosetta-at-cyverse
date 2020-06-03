#!/bin/bash

# Exit immediately if a non-zero status appears
set -e

# Execute PSIBLAST+, SEQC(bioshell) and PSIPRED+
/working_dir/ncbi-blast-2.10.0+/bin/psiblast -num_iterations 5 \
        -num_alignments 100000 \
        -num_descriptions 100000 \
        -max_hsps 100000 \
        -inclusion_ethresh 0.000001 \
        -evalue 0.000001 \
        -db /de-app-work/uniprot90_indexed/uniref90.fasta \
        -query /de-app-work/*.fasta \
        -show_gis  -outfmt 6 \
        -num_threads 1 \
        -out outfile.psi \
        -out_pssm outfile.asn1

/working_dir/bioshell/bin/seqc -in:profile:asn1=outfile.asn1 -out:profile:txt=outfile.prof

/working_dir/psipred-master/BLAST+/runpsipredplus *.fasta

# Post processing - remove unneeded files and move computational output to a "results"-folder
# Rename computational output in order to be recognized by the subsequent container (for workflow functionality)

rm -f psitmp*

mkdir psipred-plus_results

mv *.ss /de-app-work/psipred-plus_results/
mv *.horiz /de-app-work/psipred-plus_results/
cp *.ss2 /de-app-work/psipred-plus_results/

mv *.ss2 outfile.ss2
mv *.fasta outfile.fasta
