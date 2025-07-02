FROM eclipse-temurin:17-jdk as build

# Descarga GlassFish 7
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -L -o glassfish.zip https://download.eclipse.org/ee4j/glassfish/glassfish-7.0.10.zip && \
    unzip glassfish.zip -d /opt && \
    rm glassfish.zip

ENV GLASSFISH_HOME /opt/glassfish7
ENV PATH $GLASSFISH_HOME/bin:$PATH

# Copiar el WAR a autodeploy
COPY Impulse-Center.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/

# Exponer el puerto 8080
EXPOSE 8080

# Comando para iniciar GlassFish
CMD ["asadmin", "start-domain", "-v"]