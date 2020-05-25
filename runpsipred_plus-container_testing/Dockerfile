FROM ubuntu:18.04

MAINTAINER Florian Wieser
LABEL Description="This image contains the PSIPRED+ protein secondary structure prediction algorithm and is intended for integration in the CyVerse Austria Discovery Environment"

RUN apt-get -y update \
&& apt-get -y install build-essential \
&& apt-get -y install tcsh

COPY psipred-master /psipred
COPY wrapper_psipred-plus.sh /psipred/BLAST+/wrapper_psipred-plus.sh
COPY ncbi-blast-2.10.0+ /ncbi-blast-2.10.0+ 

WORKDIR /psipred/BLAST+/

RUN chmod +x wrapper_psipred-plus.sh
RUN cd ../src && make && make install

ENV PATH="/uniref90_indexed:/ncbi-blast-2.10.0+/bin:/psipred:/psipred/src:/psipred/BLAST+:/psipred/bin:${PATH}"

ENTRYPOINT ["/bin/bash"]

CMD ["wrapper.sh"]
