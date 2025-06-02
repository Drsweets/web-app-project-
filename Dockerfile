# Use an official Tomcat image with Java 17
FROM tomcat:10.1-jdk17-temurin

# Set environment variables
ENV CATALINA_HOME /usr/local/tomcat
ENV WAR_FILE maven-web-app.war

# Clean default webapps (optional but good for minimal footprint)
RUN rm -rf $CATALINA_HOME/webapps/*

# Copy built WAR to Tomcat webapps directory
COPY target/${WAR_FILE} $CATALINA_HOME/webapps/${WAR_FILE}

# Expose the default Tomcat port
EXPOSE 8080

# Health check (optional but useful)
HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

