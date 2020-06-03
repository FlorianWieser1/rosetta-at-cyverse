FROM ubuntu:20.04

MAINTAINER Florian Wieser <florian.wieser@tugraz.at>
LABEL Description="This image contains Rosetta's fragment picking protocol and is intended for integration into the CyVerse Austria Discovery Environment"

RUN apt-get -y update

ENV WD /working_dir
WORKDIR ${WD}

COPY filtered.vall.dat.2006-05-05.gz ${WD}
COPY fragment_picker.static.linuxgccrelease ${WD} 
COPY wrapper_fragment-picking.sh ${WD}

ENTRYPOINT ["/working_dir/wrapper_fragment-picking.sh"]
