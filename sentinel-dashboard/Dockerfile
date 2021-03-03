FROM java:8
# 作者
MAINTAINER lmay Zhou <lmay@lmaye.com>
# 复制上下文目录下的jar包到容器里,使用COPY命令亦可
ADD sentinel-dashboard-1.8.1.jar sentinel-dashboard-1.8.1.jar
# 端口
EXPOSE 8080
#指定容器启动程序及参数 <ENTRYPOINT> "<CMD>"
CMD java ${JAVA_OPTS} -jar sentinel-dashboard-1.8.1.jar
#ENTRYPOINT ["java", "-jar", "sentinel-dashboard-1.8.1.jar"]