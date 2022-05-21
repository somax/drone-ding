# drone-ding

Drone plugin for sending **DingTalk** notifications. 
发送通知到**钉钉**的 Drone 插件

## usage

### .drone.yml

```yml
kind: pipeline
type: docker
name: default

steps:
- name: debug
  image: somax/drone-ding:2022
  settings:
    webhook: https://httpbin.org/post
    timezone: Asia/Shanghai
    title: "自动构建通知 $CI_REPO_NAME Build#$CI_BUILD_NUMBER $DRONE_BUILD_STATUS"
    template: "## 自动构建 \n\n### Build#$CI_BUILD_NUMBER $DRONE_BUILD_STATUS\n\n🚀 由 $CI_COMMIT_AUTHOR_NAME 提交到 $CI_COMMIT_REF\n\n👉 [构建详情]($DRONE_BUILD_LINK)\n\n🕑 $DATETIME" 

```

出于安全考虑，你应该将 webhook 设置在 drone 的 Secrets 里面，假设名称是 `ding_webhook`。

```yml
  settings:
    webhook: 
      from_secret: ding_webhook
```

### 自定义

```yml
  settings:
    webhook: https://httpbin.org/post
    timezone: Asia/Shanghai
    title: "自动构建通知 $CI_REPO_NAME Build#$CI_BUILD_NUMBER $DRONE_BUILD_STATUS"
    template: "## 自动构建 \n\n### Build#$CI_BUILD_NUMBER $DRONE_BUILD_STATUS\n\n🚀 由 $CI_COMMIT_AUTHOR_NAME 提交到 $CI_COMMIT_REF\n\n👉 [构建详情]($DRONE_BUILD_LINK)\n\n🕑 $DATETIME" 
```

完整的环境变量引用请查看官方文档: https://docs.drone.io/pipeline/environment/reference/


### 构建容器镜像
```sh
./build.sh
```

### 测试
```sh
drone exec 
```
