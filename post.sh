#!/bin/sh
set -e
echo drone-ding v0.1.0

# drone secrets
if [ "$DING_WEBHOOK" != "" ]; then
  PLUGIN_WEBHOOK=$DING_WEBHOOK
fi

# default title
if [ "$PLUGIN_TITLE" == "" ]; then
  PLUGIN_TITLE="${DRONE_BUILD_STATUS} ${DRONE_REPO_OWNER}/${DRONE_REPO_NAME} #${DRONE_BUILD_NUMBER} "
fi

# default message
if [ "$PLUGIN_TEMPLATE" == "" ]; then
  PLUGIN_TEMPLATE="## Build #${DRONE_BUILD_NUMBER} ${DRONE_BUILD_STATUS}\n> [${DRONE_REPO_OWNER}/${DRONE_REPO_NAME}#${DRONE_COMMIT}](${DRONE_BUILD_LINK}) (${DRONE_BRANCH}) \n>by ${DRONE_COMMIT_AUTHOR} \n${DRONE_COMMIT_MESSAGE}" 
fi

echo debug: template \n ${PLUGIN_TEMPLATE}
echo debug: title \n ${PLUGIN_TITLE}

curl ${PLUGIN_WEBHOOK} \
   -H "Content-Type: application/json" \
   -d "{\"msgtype\": \"markdown\",\"markdown\": {\"title\":\"${PLUGIN_TITLE}\", \"text\":\"${PLUGIN_TEMPLATE}\"}}"
   
