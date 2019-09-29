FROM ccr.ccs.tencentyun.com/dcc-java/openjdk-tini-arthas-ttf:v22
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN mkdir /logs && \
chmod +x /docker-entrypoint.sh
COPY ./target/Crown.jar app.jar
CMD ["/docker-entrypoint.sh"]

#FROM ccr.ccs.tencentyun.com/dcc-java/alpine-oraclejdk8:slim
#
#ADD target/service-mall.jar /app.jar
#RUN sh -c 'touch /app.jar'
#ENV JAVA_OPTS=""
#
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]