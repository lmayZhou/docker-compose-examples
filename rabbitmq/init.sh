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
echo -e "${BLUE_COLOR}---> create [rabbitmq]directory start.${RES}"
if [ ! -d "./rabbitmq/" ]; then
mkdir -p ./rabbitmq/data
fi
echo -e "${BLUE_COLOR}===> create directory success.${RES}"

# 目录授权(data/logs 都要授读/写权限)
echo -e "${BLUE_COLOR}---> directory authorize start.${RES}"
if [ -d "./rabbitmq/" ]; then
chmod 777 ./rabbitmq/data/
fi
echo -e "${BLUE_COLOR}===> directory authorize success.${RES}"

# 移动配置文件
echo -e "${BLUE_COLOR}---> move [rabbitmq]config file start.${RES}"
if [ -f "./rabbitmq.conf" ]; then
mv ./rabbitmq.conf ./rabbitmq
fi
echo -e "${BLUE_COLOR}===> move config files success.${RES}"
echo -e "${GREEN_COLOR}>>>>>>>>>>>>>>>>>> The End <<<<<<<<<<<<<<<<<<${RES}"

# 部署项目
echo -e "${BLUE_COLOR}==================> Docker deploy Start <==================${RES}"
docker-compose up --build -d
