FROM eclipse-temurin:17-jdk

# Crear una carpeta para la aplicación
WORKDIR /app

# Copiar el WAR y Payara Micro
COPY Impulse-Center.war /app/
COPY payara-micro.jar /app/

# Exponer el puerto (Render usará 8080)
EXPOSE 8080

# Usar una cantidad limitada de memoria para evitar "out of memory"
CMD ["java", "-Xmx256m", "-jar", "payara-micro.jar", "--deploy", "/app/Impulse-Center.war", "--contextroot", "/"]
