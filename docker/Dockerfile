# Dockerfile for Caffe-CPU for use with Batch Shipyard on Azure Batch

FROM ubuntu:16.04
MAINTAINER Daisy Deng

USER root
RUN apt-get update && \
      apt-get -y install sudo

RUN sudo apt-get -y install  apt-transport-https

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

ADD /sudoers.txt /etc/sudoers
RUN chmod 440 /etc/sudoers

USER docker
CMD /bin/bash


########## install.NET Core SDK https://www.microsoft.com/net/core#linuxubuntu
RUN sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN sudo apt-get update


RUN sudo apt-get -y install dotnet-dev-1.0.4

######################  install AzCopy Linux Preview https://azure.microsoft.com/en-us/blog/announcing-azcopy-on-linux-preview/
RUN sudo apt-get -y install wget
WORKDIR "~/"
RUN pwd
RUN wget -O ~/azcopy.tar.gz https://aka.ms/downloadazcopyprlinux
RUN chmod 777 ~/azcopy.tar.gz
RUN mkdir ~/azcopy
RUN sudo tar -xf ~/azcopy.tar.gz -C ~/azcopy


RUN sudo /bin/bash ~/azcopy/install.sh
COPY converter.sh /home/docker/
RUN mkdir ~/testdata/
RUN sudo chmod u+x /home/docker/converter.sh
#RUN cd ~/ \
#    && /bin/bash /home/docker/converter.sh
