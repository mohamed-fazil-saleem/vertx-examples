FROM vertx/vertx4-exec:4.3.5
RUN apt-get update && apt-get install git maven -y
RUN git clone https://github.com/vert-x3/vertx-examples.git
RUN export JAVA_HOME=/usr/lib/jvm/default-java && export M2_HOME=/opt/maven && export MAVEN_HOME=/opt/maven && export PATH=${M2_HOME}/bin:${PATH}
RUN mvn -version
COPY . .
RUN ./start.sh

ENTRYPOINT ["java", "-jar", "/vertx-examples/spring-examples/spring-verticle-factory/target/spring-verticle-factory-4.3.1.jar"]