FROM ubuntu:18.04

MAINTAINER Florian Wieser
LABEL Description="This image contains Rosetta's contactMaps protocol (version 3.12) and is intended for integration in the CyVerse Austria Discovery Environment"

RUN apt-get -y update \
&& apt-get -y install vim \ 
&& apt-get -y install gnuplot \
&& apt-get -y install python \
&& apt-get -y install python-matplotlib

ENV WD /working_dir
WORKDIR ${WD}
ENV ROSETTA3_DB ${WD}/database_complete 

COPY contactMap.static.linuxgccrelease ${WD} 
COPY wrapper_contact-map.sh ${WD}
COPY plot-contactmap.py ${WD}

ENTRYPOINT ["/working_dir/wrapper_contact-map.sh"]
