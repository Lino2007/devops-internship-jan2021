FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} admin.jar
EXPOSE 9101
ENTRYPOINT ["java","-jar","/admin.jar"]
