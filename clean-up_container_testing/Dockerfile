FROM ubuntu:20.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image will just delete workflow related files named "outfile". It is used to clean up intermediate input/output files that were produced for file transfer between various applications in the CyVerse Austria Discovery Environment."

RUN apt-get -y update

ENV WD /working_dir
WORKDIR ${WD}

COPY clean-up.sh ${WD} 

ENTRYPOINT ["/working_dir/clean-up.sh"]
