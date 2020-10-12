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

docker-compose.yml [Mysql]
version: "3"
services:
  mysql:
    container_name: lmay-mysql
    image: mysql:8.0.16
    environment:
      MYSQL_DATABASE: my-docker
      MYSQL_ROOT_PASSWORD: root
      MYSQL_ROOT_HOST: '%'
      TZ: Asia/Shanghai
    restart: always
    ports:
      - 3306:3306
    volumes:
      - ./mysql/my.cnf:/etc/my.cnf
      - ./mysql/data:/var/lib/mysql
      # 初始化数据脚本
      # - ./mysql/init:/docker-entrypoint-initdb.d/

# 配置和MySql容器互通的网络net-docker
networks: 
  default:
    external:
      name: net-docker

docker-compose.yml [Nacos]
version: "3"
services:
  nacos:
    container_name: lmay-nacos
    image: nacos/nacos-server:1.1.4
    restart: on-failure
    ports:
      - 8848:8848
    environment:
      - PREFER_HOST_MODE=hostname
      - MODE=standalone
      - SPRING_DATASOURCE_PLATFORM=mysql
      - MYSQL_MASTER_SERVICE_HOST=lmay-mysql
      - MYSQL_MASTER_SERVICE_DB_NAME=nacos_db
      - MYSQL_MASTER_SERVICE_PORT=3306
      - MYSQL_SLAVE_SERVICE_HOST=lmay-mysql
      - MYSQL_SLAVE_SERVICE_PORT=3306
      - MYSQL_MASTER_SERVICE_USER=root
      - MYSQL_MASTER_SERVICE_PASSWORD=root
    volumes:
      - ./custom.properties:/home/nacos/init.d/custom.properties
      - ./logs/:/home/nacos/logs

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
