# docker-compose-nacos

#### 兼容 MySql8
1. 替换Jar包
[root@localhost services]# docker cp ./nacos-server.jar lmay-nacos:/home/nacos/target/nacos-server.jar
2. 重启nacos
[root@localhost services]# docker restart lmay-nacos

#### 创建虚拟网络，关联已经安装好的MySql容器
```
# 创建一个名为 net-docker 的网络，在docker-compose中使用external_links关键字关联
[root@localhost services]# docker network create net-docker --driver bridge

docker-compose.yml
# 配置和MySql容器互通的网络net-docker
networks: 
  default:
    external:
      name: net-docker
```

### 联系我
    * QQ: 379839355
    * QQ群: [Æ┊Java✍交流┊Æ](https://jq.qq.com/?_wv=1027&k=5Dqlg2L)
    * QQ群: [Cute Python](https://jq.qq.com/?_wv=1027&k=58hW2jl)
    * Email: lmay@lmaye.com
    * Home: [lmaye.com](https://www.lmaye.com)
    * GitHub: [lmayZhou](https://github.com/lmayZhou)
