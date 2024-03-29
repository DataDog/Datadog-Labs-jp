#!/bin/bash
# Copyright VMware, Inc.
# SPDX-License-Identifier: APACHE-2.0

export JAVA_HOME="/opt/bitnami/java"
export JAVA_OPTS="-Djava.awt.headless=true -XX:+UseG1GC -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true -Duser.home=/opt/bitnami/tomcat"
export CATALINA_PID="/opt/bitnami/tomcat/temp/catalina.pid"

# Load Tomcat Native library
export LD_LIBRARY_PATH="/opt/bitnami/tomcat/lib:${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

# Memory settings
. "/opt/bitnami/tomcat/conf/bitnami/memory.sh"

# Additional configuration
export JAVA_OPTS="${JAVA_OPTS} -Xms2560m -Xmx2560m -XX:MaxMetaspaceSize=512m -Djava.net.preferIPv4Stack=true -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Dfile.encoding=UTF8 -Duser.timezone=GMT"

export CATALINA_OPTS="-javaagent:/opt/bitnami/tomcat/bin/opentelemetry-javaagent.jar -Dotel.service.name=liferay -Dotel.resource.attributes=deployment.environment=linux-otel -Dotel.java.disabled.resource.providers=io.opentelemetry.instrumentation.resources.HostResourceProvider"
