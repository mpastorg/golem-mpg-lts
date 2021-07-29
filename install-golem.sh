#!/bin/bash

exec_datetime=$(date +'%Y%m%d%H%M%S')

git clone https://github.com/mpastorg/golem-mpg-lts golem-$exec_datetime
cd golem-$exec_datetime
rm .env
echo 'COMPOSE_PROJECT_NAME=golem-'$exec_datetime >> .env
echo 'YA_PAYMENT_NETWORK=mainnet' >> .env
echo 'YA_ACCOUNT=0x6A6e231bA285DdBa76C2E866Bc35446025cCd63a' >> .env
cp .env .env.local
#printf '\n\n\n\n' | make setup &
printf '\n\n\n\n' | docker-compose run -d node golemsp run
sleep 90
#make up

