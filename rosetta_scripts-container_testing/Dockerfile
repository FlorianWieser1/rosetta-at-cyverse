FROM ubuntu:20.04

MAINTAINER Florian Wieser
LABEL Description="This image contains RosettaScripts (version 3.12) and is intended for integration in the Cyverse Austria Discovery Environmnet" 

RUN apt-get -y update

ENV WD /working_dir
WORKDIR ${WD}
ENV ROSETTA3_DB ${WD}/database_complete

COPY rosetta_scripts.static.linuxgccrelease ${WD}
COPY wrapper_rosetta-scripts.sh ${WD}

ENTRYPOINT ["/working_dir/wrapper_rosetta-scripts.sh"]
