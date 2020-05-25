FROM ubuntu:18.04
RUN apt-get -y update \
&& apt-get -y install vim \ 
&& apt-get -y install gnuplot \
&& apt-get -y install python \
&& apt-get -y install python-matplotlib

ENV WD /working_dir
WORKDIR ${WD}
ENV ROSETTA3_DB /de-app-work/database_complete 

ADD wrapper.sh ${WD}/wrapper.sh
ADD plot-contactmap.py ${WD}/plot-contactmap.py
ADD contactMap.static.linuxgccrelease ${WD}/contactMap.static.linuxgccrelease

ENV PATH="/working_dir/database:/working_dir:${PATH}"

ENTRYPOINT ["/working_dir/wrapper.sh"]
