FROM tomcat:9.0.105-jdk17-corretto-al2
COPY target/*.war /usr/local/tomcat/webapps/sweettooth.war
