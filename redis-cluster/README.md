# redis-cluster

#### 介绍
Docker 容器部署实践学习实例集合，仅供学习参考！如有更好的方案和idea，欢迎互相交流！如您觉得该项目对您有所帮助，欢迎点击右上方的Star标记，给予支持！！！谢谢 ~ ~

#### 部署问题
1. redis启动警告: WARNING overcommit_memory is set to 0! Background save may fail under low memory condition.
解决方法: (临时生效命令: sysctl vm.overcommit_memory=1)
```shell script
# 1. 修改配置
[root@es-node3 redis-cluster]# vi /etc/sysctl.conf
# 2. 添加: vm.overcommit_memory=1
# 3. 加载配置
[root@es-node3 redis-cluster]# source /etc/sysctl.conf 
-bash: vm.max_map_count=262144: command not found
-bash: vm.overcommit_memory=1: command not found
```

2. redis启动警告: WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis.
解决方法:
```shell script
# 1. 修改配置
[root@es-node3 redis-cluster]# vi /etc/rc.local
# 2. 添加: echo never > /sys/kernel/mm/transparent_hugepage/enabled
# 3. 加载配置
[root@es-node3 redis-cluster]# source /etc/rc.local
```

3. 创建Docker Redis容器网络
```shell script
# 创建网络
docker network create --subnet=172.20.0.0/16 redis-cluster
# 检查网络
docker network inspect redis-cluster
```

#### redis 节点集群
docker run --rm -it zvelo/redis-trib create --replicas 1 172.20.0.5:7001 172.20.0.5:7002 192.168.0.6:7003 192.168.0.6:7004 192.168.0.7:7005 192.168.0.7:7006