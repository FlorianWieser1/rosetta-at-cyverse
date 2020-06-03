FROM ubuntu:20.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image contains RosettaScripts (version 3.12) and is intended for integration into CyVerse Austria Discovery Environment" 

RUN apt-get -y update

ENV WD /working_dir
WORKDIR ${WD}

COPY rosetta_scripts.static.linuxgccrelease ${WD}
COPY wrapper_rosetta-scripts.sh ${WD}

ENTRYPOINT ["/working_dir/wrapper_rosetta-scripts.sh"]
