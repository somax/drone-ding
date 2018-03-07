# drone-ding

Drone plugin for sending DingTalk notifications.

## usage

##### .drone.yml

```yml
pipeline:
  ding:
    image: somax/drone-ding
    webhook: https://oapi.dingtalk.com/robot/send?access_token=xxxxxxxxx
    title:
    template:

```


```yml
pipeline:
  ding:
    image: somax/drone-ding
    secrets: [ ding_webhook ]

```