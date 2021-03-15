#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please, run this script as root!"
  exit
fi  

d="$(pwd | grep -c devops-internship)"
if [ $d -eq 0 ]
then 
    tput setaf 1; echo "Script is not positioned in root folder (devops-internship)";
    tput setaf 9; exit 1
fi

#building phase
mvn clean install
docker build -t admin_ms ./admin-application
docker build -t biz_ms ./biz-application
docker build -t news_ms ./news-application
docker build -t website_ms ./website-application

