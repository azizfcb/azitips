#!/bin/bash
read -p "Please Aziz, enter your Datadog API key:" key
DD_API_KEY=$key bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)"