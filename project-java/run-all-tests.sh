#!/bin/bash

# Función para obtener milisegundos usando Python, sin usar "date"
function get_millis() {
    python3 -c 'import time; print(int(time.time() * 1000))'
}

echo "======================================="
echo "  Construyendo y corriendo Java Test  "
echo "======================================="
cd project-java || exit 1

# Construir la imagen de Docker para Java
docker build -t java-concurrency-test .

# Capturar el tiempo de inicio en ms
START_JAVA=$(get_millis)
# Ejecutar el contenedor
docker run --rm java-concurrency-test
# Capturar el tiempo de fin en ms
END_JAVA=$(get_millis)

TIME_JAVA=$((END_JAVA - START_JAVA))
echo "Tiempo total medido (ms) Java: $TIME_JAVA"

cd ..

echo "======================================="
echo "  Construyendo y corriendo JS Test    "
echo "======================================="
cd project-js || exit 1

# Construir la imagen de Docker para JS
docker build -t js-concurrency-test .

# Capturar el tiempo de inicio en ms
START_JS=$(get_millis)
# Ejecutar el contenedor
docker run --rm js-concurrency-test
# Capturar el tiempo de fin en ms
END_JS=$(get_millis)

TIME_JS=$((END_JS - START_JS))
echo "Tiempo total medido (ms) JS: $TIME_JS"

cd ..

echo "======================================="
echo "          ¡Pruebas Finalizadas!        "
echo "======================================="
echo "Resumen:"
echo " - Java: $TIME_JAVA ms"
echo " - JS  : $TIME_JS ms"
