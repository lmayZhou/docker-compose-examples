#./bin/bash# 定义颜色BLUE_COLOR="\033[36m"RED_COLOR="\033[31m"GREEN_COLOR="\033[32m"VIOLET_COLOR="\033[35m"RES="\033[0m"echo -e "${BLUE_COLOR}# ######################################################################${RES}"echo -e "${BLUE_COLOR}#                       Docker Redis Shell Script                      #${RES}"echo -e "${BLUE_COLOR}#                       Blog: www.lmaye.com                            #${RES}"echo -e "${BLUE_COLOR}#                       Email: lmay@lmaye.com                          #${RES}"echo -e "${BLUE_COLOR}# ######################################################################${RES}"# 创建目录echo -e "${BLUE_COLOR}---> create [redis]directory start.${RES}"if [ ! -d "./redis/" ]; then  mkdir -p ./redis/data/7001 ./redis/data/7002 ./redis/logsfiecho -e "${BLUE_COLOR}===> create directory success.${RES}"# 目录授权(data/logs 都要授读/写权限)echo -e "${BLUE_COLOR}---> directory authorize start.${RES}"if [ -d "./redis/" ]; then  chmod 777 ./redis/data/7001/ ./redis/data/7002/ ./redis/logs/fiecho -e "${BLUE_COLOR}===> directory authorize success.${RES}"# 移动配置文件echo -e "${BLUE_COLOR}---> move [redis]config file start.${RES}"if [ -f "./redis-7001.conf" ]; then  mv ./redis-7001.conf ./redisfiif [ -f "./redis-7002.conf" ]; then  mv ./redis-7002.conf ./redisfiecho -e "${BLUE_COLOR}===> move config files success.${RES}"echo -e "${GREEN_COLOR}>>>>>>>>>>>>>>>>>> The End <<<<<<<<<<<<<<<<<<${RES}"# 部署项目echo -e "${BLUE_COLOR}==================> Docker deploy Start <==================${RES}"docker-compose up --build -d