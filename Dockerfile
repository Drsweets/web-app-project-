# Use official Tomcat image with Java 17
FROM tomcat:10.1-jdk17-temurin

# Set environment variables
ENV CATALINA_HOME /usr/local/tomcat
ENV WAR_FILE maven-web-app.war

# Remove default apps
RUN rm -rf $CATALINA_HOME/webapps/*

# Copy built WAR into Tomcat
COPY target/${WAR_FILE} $CATALINA_HOME/webapps/ROOT.war

# Expose default port
EXPOSE 8080

# Optional: Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1
