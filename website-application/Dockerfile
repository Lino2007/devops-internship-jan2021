FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} website.jar
EXPOSE 9301
ENTRYPOINT ["java","-jar","/website.jar"]
