#!/bin/bash
source /env.sh


# This script should not return or the container will exit
# The last command called should execute in the foreground

# Start Machine Agent
# Start manually with: docker exec <container> /start-machine-agent.sh
# /start-machine-agent.sh
k=$(find /opt/survey-client/appagent/ -maxdepth 1 -type d -name "ver*" | sed "s:^/opt/survey-client/appagent/::")
sed -i "s/127.0.0.1/${IP_ADDRES}/g" /opt/survey-client/appagent/$k/external-services/npm/npm-service.properties
sed -i "s/localhost/${IP_ADDRES}/g" /opt/survey-client/appagent/$k/external-services/npm/npm-service.properties

/start-appserver-agent.sh
