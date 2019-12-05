#!/bin/bash

# 定义颜色
BLUE_COLOR="\033[36m"
RED_COLOR="\033[31m"
GREEN_COLOR="\033[32m"
VIOLET_COLOR="\033[35m"
RES="\033[0m"

echo -e "${BLUE_COLOR}# ######################################################################${RES}"
echo -e "${BLUE_COLOR}#                       Docker Compose Shell Script                    #${RES}"
echo -e "${BLUE_COLOR}#                       Blog: www.lmaye.com                            #${RES}"
echo -e "${BLUE_COLOR}#                       Email: lmaye@lmaye.com                         #${RES}"
echo -e "${BLUE_COLOR}# ######################################################################${RES}"

# 创建目录
echo -e "${BLUE_COLOR}---> create [mysql]directory start.${RES}"
if [ ! -d "./mysql/" ]; then
mkdir -p ./mysql/data ./mysql/init
fi

echo -e "${RED_COLOR}---> create [nacos]directory start.${RES}"
if [ ! -d "./nacos/" ]; then
mkdir -p ./nacos/logs
fi
echo -e "${BLUE_COLOR}===> create directory success.${RES}"

# 目录授权(data/logs 都要授读/写权限)
echo -e "${BLUE_COLOR}---> directory authorize start.${RES}"
if [ -d "./mysql/" ]; then
chmod 777 ./mysql/data/
fi
echo -e "${BLUE_COLOR}===> directory authorize success.${RES}"

# 移动配置文件
echo -e "${BLUE_COLOR}---> move [mysql]config file start.${RES}"
if [ -f "./my.cnf" ]; then
mv ./my.cnf ./mysql
fi
# 数据库初始化脚本
if [ -f "./nacos-db.sql" ]; then
mv ./nacos-db.sql ./mysql/init
fi

echo -e "${RED_COLOR}---> move [nacos]config file start.${RES}"
if [ -f "./custom.properties" ]; then
mv ./custom.properties ./nacos
fi
echo -e "${BLUE_COLOR}===> move config files success.${RES}"
echo -e "${GREEN_COLOR}>>>>>>>>>>>>>>>>>> The End <<<<<<<<<<<<<<<<<<${RES}"

# 部署项目
echo -e "${BLUE_COLOR}==================> Docker deploy Start <==================${RES}"
docker-compose up --build -d