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
echo -e "${BLUE_COLOR}#                       Email: lmay@lmaye.com                          #${RES}"
echo -e "${BLUE_COLOR}# ######################################################################${RES}"

# 创建目录
echo -e "${BLUE_COLOR}---> create [config]directory start.${RES}"
if [ ! -d "./config/" ]; then
mkdir ./config
fi
echo -e "${BLUE_COLOR}===> create directory success.${RES}"

# 移动配置文件
echo -e "${BLUE_COLOR}---> move config file start.${RES}"
if [ -f "./alertmanager.yml" ] && [ -f "./node_down.yml" ] && [ -f "./prometheus.yml" ]; then
mv ./alertmanager.yml ./config
mv ./node_down.yml ./config
mv ./prometheus.yml ./config
fi
echo -e "${BLUE_COLOR}===> move config files success.${RES}"
echo -e "${GREEN_COLOR}>>>>>>>>>>>>>>>>>> The End <<<<<<<<<<<<<<<<<<${RES}"

# 部署项目
echo -e "${BLUE_COLOR}==================> Docker deploy Start <==================${RES}"
docker-compose up --build -d