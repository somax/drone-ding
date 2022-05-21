#!/bin/sh
set -e

export TZ=$PLUGIN_TIMEZONE
DATETIME=$(date +"%Y-%m-%d %H:%M:%S")

# drone secrets
if [ "$DING_WEBHOOK" != "" ]; then
  PLUGIN_WEBHOOK=$DING_WEBHOOK
fi

# default title
if [ "$PLUGIN_TITLE" == "" ]; then
  PLUGIN_TITLE="自动构建通知 $CI_REPO_NAME Build#$CI_BUILD_NUMBER $DRONE_BUILD_STATUS"
fi

# default message
if [ "$PLUGIN_TEMPLATE" == "" ]; then
  PLUGIN_TEMPLATE="## 自动构建 \n\n### $CI_REPO_NAME Build#$CI_BUILD_NUMBER $DRONE_BUILD_STATUS\n\n🚀 由 $CI_COMMIT_AUTHOR_NAME 提交到 $CI_COMMIT_REF\n\n👉 [构建详情]($DRONE_BUILD_LINK)\n\n🕑 $DATETIME" 
fi

if [ "$PLUGIN_TIMEZONE" == "" ]; then
  PLUGIN_TIMEZONE="Asia/Shanghai" 
fi


JSON="{\"msgtype\":\"markdown\",\"markdown\":{\"title\":\"$PLUGIN_TITLE\",\"text\":\"$PLUGIN_TEMPLATE\"}}"

echo "[DEBUG] PLUGIN_TIMEZONE: $PLUGIN_TIMEZONE"
echo "[DEBUG] JSON: $JSON"
echo "[DEBUG] PLUGIN_WEBHOOK: $PLUGIN_WEBHOOK"
echo "[DEBUG] DATETIME: $DATETIME"

if [ "$PLUGIN_WEBHOOK" == "" ]; then
  echo "[ERROR] Webhook is not specified."
else
  wget -qS -O - --header="Content-Type:application/json" --post-data "$JSON" $PLUGIN_WEBHOOK  
fi
