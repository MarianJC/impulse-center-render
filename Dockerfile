FROM eclipse-temurin:17-jdk

# Crear una carpeta para la aplicación
WORKDIR /app

# Copiar el WAR y Payara Micro
COPY Impulse-Center.war /app/
COPY payara-micro.jar /app/

# Exponer el puerto (Render usará 8080)
EXPOSE 8080

# Comando para iniciar Payara Micro desplegando el WAR
CMD ["java", "-jar", "/payara-micro.jar", "--deploy", "/Impulse-Center.war"]