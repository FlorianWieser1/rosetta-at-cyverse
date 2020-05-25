FROM ubuntu:16.04

MAINTAINER Florian Wieser
LABEL Description="This image contains Rosetta's abinitio protocol (version 3.12) and is intended for integration in the Cyverse Austria Discovery Environment"

RUN apt-get -y update

ENV WD /working_dir
WORKDIR ${WD}
ENV ROSETTA3_DB ${WD}/database_complete

COPY AbinitioRelax.static.linuxgccrelease ${WD}
COPY wrapper_abinitio.sh ${WD} 

ENTRYPOINT ["/working_dir/wrapper_abinitio.sh"]
