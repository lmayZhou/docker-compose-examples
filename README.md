# docker-compose-examples

#### 介绍
Docker 容器部署各应用服务实践学习实例集合，部署脚本仅供学习参考！如有更好的方案和idea，欢迎互相交流！如您觉得该项目对您有所帮助，欢迎点击右上方的Star标记，给予支持！！！谢谢 ~ ~

#### 部署架构
(学习案例连续更新中...请Star和关注支持一下，随时获取最新动态！谢谢 ~ ~)

    docker-compose-examples             # Docker 容器部署各应用服务案例
        - es-nodes-cluster              # ELK 集群
            -- node1-master             # 主节点
            -- node2-slave              # 子节点1
            -- node3-slave              # 子节点2
        - es-nodes-stand-alone          # ELK 集群(单机)
        - jekins                        # Jekins
        - mysql                         # Mysql
        - nacos                         # Nacos
        - rabbitmq                      # RabbitMQ
        - redis                         # Redis
        - redis-cluster                 # Redis 集群
            -- redis-master-slave1      # 节点1
            -- redis-master-slave2      # 节点2
            -- redis-master-slave3      # 节点3
        - zookeeper                     # Zookeeper    

### 参与贡献
 1. 2019年08月15日: 构建 docker-compose-examples, es-nodes-stand-alone, es-nodes-cluster 等服务 [Service]
 2. 2019年08月28日: 构建 Mysql, Redis, Zookeeper 等服务 [Service]
 3. 2019年10月08日: 构建 Redis-cluster 集群服务 [Service]
 4. 2019年11月07日: 构建 Jenkins 服务 [Service]
 5. 2019年12月05日: 构建 Nacos 服务 [Service]
 6. 2019年12月06日: 构建 RabbitMQ 服务, 更新 README.md 文档 [Service/文档]


### 相关文章
#### 『 Centos 7 快速教程 』
- [Centos 7 静态IP设置](https://www.lmaye.com/2017/12/22/20180809103359/)
- [Linux增加bash脚本为service，开机自启服务脚本配置](https://www.lmaye.com/2017/12/23/20180809103413/)
- [Centos7 安装 Docker CE](hhttps://www.lmaye.com/2019/04/28/20190428183357/)
- [Centos7 安装 JDK1.8](https://www.lmaye.com/2019/04/29/20190429005630/)
- [Centos7 安装较高版本Ruby2.2+（RVM 安装）](https://www.lmaye.com/2019/01/24/20190124223042/)
- [Centos7 开启Docker远程API访问端口](https://www.lmaye.com/2019/06/04/20190604230713/)

#### 『 Docker 快速教程 』
- [Docker 安装 MongoDB](https://www.lmaye.com/2019/05/06/20190506232452/)
- [Docker 安装 MySQL 8.0](https://www.lmaye.com/2019/05/22/20190522162930/)
- [Dockerfile 部署MySql 8并初始化数据脚本](https://www.lmaye.com/2019/06/02/20190602133656/)

### 联系我
    * QQ: 379839355
    * QQ群: [Æ┊Java✍交流┊Æ](https://jq.qq.com/?_wv=1027&k=5Dqlg2L)
    * QQ群: [Cute Python](https://jq.qq.com/?_wv=1027&k=58hW2jl)
    * Email: lmay@lmaye.com
    * Home: [lmaye.com](https://www.lmaye.com)
    * GitHub: [lmayZhou](https://github.com/lmayZhou)