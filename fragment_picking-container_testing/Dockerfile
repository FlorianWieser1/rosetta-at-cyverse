FROM ubuntu:18.04

MAINTAINER Florian Wieser
LABEL Description="This image contains Rosetta's fragment picking protocol and is intended for integration into the CyVerse Austria Discovery Environment"

RUN apt-get -y update

ENV WD /working_dir
WORKDIR ${WD}
ENV ROSETTA3_DB ${WD}/database_complete

COPY filtered.vall.dat.2006-05-05.gz ${WD}/filtered.vall.dat.2006-05-05.gz
COPY fragment_picker.static.linuxgccrelease ${WD} 
COPY wrapper_fragment-picking.sh ${WD}

ENTRYPOINT ["/working_dir/wrapper_fragment-picking.sh"]
