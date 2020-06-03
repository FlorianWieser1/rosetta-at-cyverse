FROM ubuntu:18.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image contains Rosetta's contactMaps protocol (version 3.12) and is intended for integration in the CyVerse Austria Discovery Environment"

RUN apt-get -y update \
&& apt-get -y install python \
&& apt-get -y install python-matplotlib \
&& apt-get -y install gnuplot

ENV WD /working_dir
WORKDIR ${WD}

COPY contactMap.static.linuxgccrelease ${WD} 
COPY wrapper_contact-map.sh ${WD}
COPY plot-contactmap.py ${WD}

ENTRYPOINT ["/working_dir/wrapper_contact-map.sh"]
