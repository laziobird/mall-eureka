##打基本Java镜像
FROM oracle-jdk8:1.0
MAINTAINER Tim Jiang<jzw_1985@163.com>

## Change the timezone 
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

ADD ./target/mall-eureka-*.jar /opt/mall-eureka.jar
ENV JAVA_OPTS="-Xmx1g -Xms512m -XX:NewSize=192m -XX:MaxNewSize=384m -XX:+HeapDumpOnOutOfMemoryError"

ENV PROJECT="/opt/mall-eureka.jar"
EXPOSE 7000

##3、脚本启动
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -server -Djava.security.egd=file:/dev/./urandom -jar $PROJECT" ]


