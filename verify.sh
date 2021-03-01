#!/bin/bash

declare -a errMsg=("Admin-application returned error!" "News-application returned error!"
                   "Biz-application returned error!" "Website-application returned error!")
declare -a okMsg=("Admin-application is running!" "News-application is running!"
                  "Biz-application is running!" "Website-application is running!")
declare -a urls=("http://localhost:9101/ui/" "http://localhost:9201/ui/"
                  "http://localhost:9001" "http://localhost:9301/ui/")
FLAG=1

#ms/app check
for i in $(seq 0 3);
do
        url="${urls[i]}"
        response=$(curl --write-out '%{http_code}' --silent --output /dev/null $url)
        if [[ $response -eq 200 ]];
        then
                tput setaf 2; echo "${okMsg[i]}"
        else
                tput setaf 1; echo "${errMsg[i]}"
				FLAG=0
        fi
done

#database container check
listen="$(netstat -tlpn | grep postgres | grep 5432 | grep -c LISTEN)"
container_up="$(docker ps | grep postgres:10 | grep -c Up)"

if [ $listen -eq 2 -a $container_up -ne 0 ]
then
    tput setaf 2; echo PostgreSQL database is running!
else
    tput setaf 1; echo PostgreSQL database returns error!
	FLAG=0
fi

echo ""

#final message
if [ $FLAG -eq 1 ]
then
    tput setaf 2; echo -e '\033[1mAll services are up and running!\033[0m'
else
    tput setaf 1; echo -e '\033[1mService(s) returned error, check service logs!\033[0m'
fi

tput setaf 9;
