## -*- docker-image-name: "sje30/simpleR2019" -*-
##FROM rocker/r-ver:3.4.4
FROM rocker/tidyverse
MAINTAINER Stephen Eglen <sje30@cam.ac.uk>

RUN apt-get -y install  make

## Prerequisites
## RUN Rscript -e 'install.packages(c("ggplot2"))'

## RUN apt-get -y install  git

ENV PROJ /home/stephen/simpleR2019
RUN mkdir -p $PROJ
RUN git clone https://github.com/sje30/simpleR2019.git $PROJ

WORKDIR $PROJ
RUN make

RUN mkdir codecheck

RUN date > codecheck/date.txt
RUN uname -a > codecheck/uname.txt

## HACK!  How to do this from MANIFEST?
RUN cp *pdf codecheck
RUN cp *csv codecheck
RUN cp *Rout codecheck

## something like:
## for file_name in $(cat MANIFEST); do
##    cp $file_name codecheck
## done


## fixme -- docker tag must be lowercase 
## TO REBUILD
#  docker build -t sje30/simpler2019 .
## TO RUN
#  docker run --name road -it sje30/simpler2019 bash

## Problems to fix
## 1. where is git in basic ubuntu?
## 2. Using tidyverse here is a bit of a cheat (but okay for getting things working)


