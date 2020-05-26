FROM ubuntu:18.04

MAINTAINER Florian Wieser
LABEL Description="This image contains Rosetta's fragment qualities protocol (version 3.12) and is intended for integration in the CyVerse Austria Discovery Environment"

RUN apt-get -y update \
&& apt-get -y install gnuplot

ENV WD /working_dir
WORKDIR ${WD}
ENV ROSETTA3_DB /database_complete

ADD r_frag_quality.static.linuxgccrelease ${WD} 
ADD wrapper_fragment-qualities.sh ${WD}

ENTRYPOINT ["/working_dir/wrapper_fragment-qualities.sh"]
