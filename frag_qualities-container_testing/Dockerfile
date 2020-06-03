FROM ubuntu:18.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image contains Rosetta's fragment qualities protocol (version 3.12) and is intended for integration into CyVerse Austria Discovery Environment"

RUN apt-get -y update \
&& apt-get -y install gnuplot 

ENV WD /working_dir
WORKDIR ${WD}

ADD r_frag_quality.static.linuxgccrelease ${WD} 
ADD wrapper_fragment-qualities.sh ${WD}

ENTRYPOINT ["/working_dir/wrapper_fragment-qualities.sh"]
