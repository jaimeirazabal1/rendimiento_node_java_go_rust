# Usamos una imagen base de OpenJDK 11
FROM openjdk:11-jdk-slim

# Creamos y establecemos nuestro directorio de trabajo
WORKDIR /app

# Copiamos el archivo Java al contenedor
COPY ConcurrencyTest.java /app

# Compilamos el archivo .java
RUN javac ConcurrencyTest.java

# Comando de inicio
CMD ["java", "ConcurrencyTest"]
