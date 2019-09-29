#!/bin/bash
set -x
JVM_OPTIONS="${JVM_OPTIONS} -XX:MetaspaceSize=128m"
#JVM_OPTIONS="${JVM_OPTIONS} -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=320m -Xmx2g -Xms2g -Xmn512m -Xss256k"
JVM_OPTIONS="${JVM_OPTIONS} -XX:-OmitStackTraceInFastThrow -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/java_heapdump.hprof"
JVM_OPTIONS="${JVM_OPTIONS} -Xloggc:/logs/gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M"
#JVM_OPTIONS="${JVM_OPTIONS} -javaagent:/opt/skywalking/agent/skywalking-agent.jar -Dskywalking.agent.service_name=service-mall -Dskywalking.collector.backend_service=oap.skywalking:11800"
JVM_OPTIONS="${JVM_OPTIONS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar"

java ${JVM_OPTIONS}