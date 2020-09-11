FROM ubuntu:18.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image contains Rosetta's abinitio protocol (version 3.12) and is intended for integration into the CyVerse Austria Discovery Environment"

RUN apt-get -y update \
&& apt-get -y install python \
&& apt-get -y install python-matplotlib 

ENV WD /working_dir
WORKDIR ${WD}

COPY AbinitioRelax.static.linuxgccrelease ${WD}
COPY extract_pdbs.static.linuxgccrelease ${WD}
COPY wrapper_abinitio.sh ${WD} 
COPY plot-score-vs-rmsd.py ${WD}
COPY rosettautil/ ${WD}/rosettautil
COPY score_scatter_plot.py ${WD}

ENV PATH /working_dir/rosettautil:$PATH

ENTRYPOINT ["/working_dir/wrapper_abinitio.sh"]
