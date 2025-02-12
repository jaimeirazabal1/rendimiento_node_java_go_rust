#!/bin/bash

echo "======================================="
echo "  Construyendo y corriendo Java Test  "
echo "======================================="
cd project-java

# Construir la imagen de Docker para Java
docker build -t java-concurrency-test .

# Ejecutar el contenedor y capturar el tiempo en una variable
START_JAVA=$(date +%s%3N)
docker run --rm java-concurrency-test
END_JAVA=$(date +%s%3N)

TIME_JAVA=$((END_JAVA - START_JAVA))
echo "Tiempo total medido (ms) Java: $TIME_JAVA"

cd ..

echo "======================================="
echo "  Construyendo y corriendo JS Test    "
echo "======================================="
cd project-js

# Construir la imagen de Docker para JS
docker build -t js-concurrency-test .

# Ejecutar el contenedor y capturar el tiempo en una variable
START_JS=$(date +%s%3N)
docker run --rm js-concurrency-test
END_JS=$(date +%s%3N)

TIME_JS=$((END_JS - START_JS))
echo "Tiempo total medido (ms) JS: $TIME_JS"

cd ..

echo "======================================="
echo "          ¡Pruebas Finalizadas!        "
echo "======================================="
echo "Resumen:"
echo " - Java: $TIME_JAVA ms"
echo " - JS  : $TIME_JS ms"
