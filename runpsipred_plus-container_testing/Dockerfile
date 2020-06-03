FROM ubuntu:20.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image contains the PSIPRED+ protein secondary structure prediction algorithm and is intended for integration in the CyVerse Austria Discovery Environment"

RUN apt-get -y update \
&& apt-get -y install build-essential \
&& apt-get -y install tcsh

ENV WD /working_dir
WORKDIR ${WD}

COPY psipred-master ${WD}/psipred-master
COPY ncbi-blast-2.10.0+ ${WD}/ncbi-blast-2.10.0+ 
COPY bioshell ${WD}/bioshell
COPY wrapper_psipred-plus.sh ${WD}

ENV PATH="/working_dir/ncbi-blast-2.10.0+/bin:/working_dir/psipred-master/bin:/uniref90_indexed:/bioshell/bin/:${PATH}"

ENTRYPOINT ["/working_dir/wrapper_psipred-plus.sh"]
