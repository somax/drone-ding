# drone-ding

Drone plugin for sending **DingTalk** notifications. 发送通知到**钉钉**的 Drone 插件

## usage

### .drone.yml

```yml
pipeline:
  ding:
    image: somax/drone-ding
    webhook: https://oapi.dingtalk.com/robot/send?access_token=xxxxxxxxx

```

出于安全考虑，你应该将 webhook 设置在 drone 的 Secrets 里面，名称是 `ding_webhook`。

```yml
pipeline:
  ding:
    image: somax/drone-ding
    secrets: [ ding_webhook ]

```

### 自定义消息格式

这是展示的是默认格式，你可以根据自己需要自定义消息格式
 
```yml
pipeline:
  ding:
    image: somax/drone-ding
    secrets: [ ding_webhook ]
    title: "${DRONE_BUILD_STATUS} ${DRONE_REPO_OWNER}/${DRONE_REPO_NAME} #${DRONE_BUILD_NUMBER}"
    template: "## Build #${DRONE_BUILD_NUMBER} ${DRONE_BUILD_STATUS}\n> [${DRONE_REPO_OWNER}/${DRONE_REPO_NAME}#${DRONE_COMMIT}](${DRONE_BUILD_LINK}) (${DRONE_BRANCH}) \n>by ${DRONE_COMMIT_AUTHOR} \n${DRONE_COMMIT_MESSAGE}"
```