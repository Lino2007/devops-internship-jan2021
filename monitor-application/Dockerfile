FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} monitor.jar
EXPOSE 8201
ENTRYPOINT ["java","-jar","/monitor.jar"]
