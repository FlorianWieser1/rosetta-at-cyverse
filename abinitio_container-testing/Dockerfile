FROM ubuntu:20.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image contains Rosetta's abinitio protocol (version 3.12) and is intended for integration into the CyVerse Austria Discovery Environment"

RUN apt-get -y update

ENV WD /working_dir
WORKDIR ${WD}

COPY AbinitioRelax.static.linuxgccrelease ${WD}
COPY extract_pdbs.static.linuxgccrelease ${WD}
COPY wrapper_abinitio.sh ${WD} 

ENTRYPOINT ["/working_dir/wrapper_abinitio.sh"]
