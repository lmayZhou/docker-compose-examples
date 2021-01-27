docker-compose 构建MySQL主从复制集群 
========================
docker-compose构建 mysql 主从复制(读写分离)集群

## 运行
```bash
cd mysql-cluster
./build.sh
```
> 可以在`build.sh`内自定义对应参数  

> 提示: 运行前需要确保安装了docker和docker-compose,具体安装方法请参考官网  

> 如果想手动安装, 则可以按照`build.sh`内的命令来手动执行即可  

## 测试看看效果
1. 给主库创建一个表, 并添加两条数据
```
docker exec mysql-master sh -c "export MYSQL_PWD=root; mysql -u root cluster_db -e 'create table code(code int); insert into code values (100), (200)'"
```
2. 查看两个从库是否同步了该表以及数据
```
docker exec mysql-slave1 sh -c "export MYSQL_PWD=root; mysql -u root cluster_db -e 'select * from code \G'"
docker exec mysql-slave2 sh -c "export MYSQL_PWD=root; mysql -u root cluster_db -e 'select * from code \G'"
```
> 如果前边的安装正确的话, 就可以看到第一步插入的两条数据了  

## 相关命令

#### 查看docker-compose运行日志
```
docker-compose logs
```

#### 查看运行的docker容器
```
docker-compose ps
```

#### 查看主库运行状态
```
docker exec mysql-master sh -c 'mysql -u root -proot -e "SHOW MASTER STATUS \G"'
```

#### 查看从库运行状态
```
docker exec mysql-slave1 sh -c 'mysql -u root -proot -e "SHOW SLAVE STATUS \G"'
docker exec mysql-slave2 sh -c 'mysql -u root -proot -e "SHOW SLAVE STATUS \G"'
```

#### 进入主库
```
docker exec -it mysql-master bash
```

#### 进入从库
```
docker exec -it mysql-slave1 bash
docker exec -it mysql-slave2 bash
```

#### 指定用户给某库权限
```shell
# 查看用户权限
show grants for db_cluster;
# 授权
GRANT ALL PRIVILEGES ON `cluster\_db2`.* TO db_cluster;
# 更新 
flush privileges;
```