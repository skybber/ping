FROM hotswapagent/tomee
RUN mkdir -p /extra_class_path
COPY ./target/ping.war ${DEPLOYMENT_DIR}
EXPOSE 8000
ENV JAVA_OPTS="-XXaltjvm=dcevm -agentlib:jdwp=transport=dt_socket,server=y,address=8000,suspend=n -javaagent:/opt/hotswap-agent/hotswap-agent.jar -Dextra.class.path=/extra_class_path"
