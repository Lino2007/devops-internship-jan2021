FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} biz.jar
EXPOSE 9001
ENTRYPOINT ["java","-jar","/biz.jar"]
