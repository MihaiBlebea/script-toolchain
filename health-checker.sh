#!/bin/bash

response=$(curl -X GET -H 'Content-type: application/json' --write-out '%{http_code}' --silent --output /dev/null https://task-manager-api.cap-rover.purpletreetech.com/api/v1/health-check)

MESSAGE="Health check failed: task-manager-api"
if [[ "$response" -eq "200" ]]; then
    MESSAGE="Health check ok: task-manager-api"
fi

curl -X POST -H 'Content-type: application/json' --silent --output /dev/null --data "{\"text\":\"${MESSAGE}\"}" https://hooks.slack.com/services/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