FROM eclipse-temurin:17-jdk

# Descargar Payara Micro
RUN curl -L -o payara-micro.jar https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara-micro/6.2024.2/payara-micro-6.2024.2.jar

# Copiar tu archivo WAR al contenedor
COPY Impulse-Center.war /app/Impulse-Center.war

# Exponer el puerto
EXPOSE 8080

# Ejecutar la aplicación con Payara Micro
CMD ["java", "-Xmx256m", "-jar", "payara-micro.jar", "--deploy", "/app/Impulse-Center.war", "--contextroot", "/"]
📦 Pasos siguientes
Guarda este archivo como Dockerfile (sin extensión) en la raíz del proyecto.

Verifica que el archivo .war esté en la misma carpeta que el Dockerfile.

En Render, crea una nueva Web Service:

Idioma: Elige Docker.

Root Directory: Deja vacío si el Dockerfile está en la raíz.

Puerto: Render detecta automáticamente el puerto 8080.

Espera a que se construya y despliegue. Tu app estará disponible en https://<tu-nombre>.onrender.com.