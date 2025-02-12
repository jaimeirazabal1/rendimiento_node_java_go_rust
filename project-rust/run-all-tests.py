#!/usr/bin/env python3

import subprocess
import time

# Definimos un listado con la información de cada proyecto:
# (nombre_imagen, carpeta, etiqueta_para_imprimir)
LANGUAGES = [
    ("java-concurrency-test", "project-java", "Java"),
    ("js-concurrency-test",   "project-js",   "Node.js"),
    ("go-concurrency-test",   "project-go",   "Go"),
    ("rust-concurrency-test", "project-rust", "Rust")
]

def build_docker_image(image_name, context_dir):
    """
    Construye la imagen Docker con `docker build -t <image_name> <context_dir>`
    """
    print(f"\n=== Construyendo imagen '{image_name}' ({context_dir}) ===")
    subprocess.run(["docker", "build", "-t", image_name, context_dir], check=True)

def measure_container_execution(image_name):
    """
    Mide el tiempo de ejecución (en milisegundos) de `docker run --rm <image_name>`
    """
    print(f"--- Ejecutando contenedor '{image_name}' ---")
    start_time = time.time()  # segundos con decimales
    # Ejecutamos el contenedor y esperamos a que termine
    subprocess.run(["docker", "run", "--rm", image_name], check=True)
    end_time = time.time()
    elapsed_s = end_time - start_time      # Segundos transcurridos
    elapsed_ms = int(elapsed_s * 1000)     # Convertir a milisegundos
    return elapsed_ms

def main():
    # 1. Construir todas las imágenes
    print("=========================================")
    print("      Construyendo imágenes Docker      ")
    print("=========================================")
    for (image_name, folder, _) in LANGUAGES:
        build_docker_image(image_name, folder)

    # 2. Medir tiempos de ejecución
    print("\n=========================================")
    print("     Ejecutando cada contenedor...      ")
    print("=========================================")

    results = []
    for (image_name, _, display_name) in LANGUAGES:
        print(f"\n=======================================")
        print(f"  Ejecutando {display_name} Concurrency Test  ")
        print("=======================================")
        time_ms = measure_container_execution(image_name)
        results.append((display_name, time_ms))

    # 3. Mostrar resultados finales
    print("\n=======================================")
    print("        ¡Pruebas Finalizadas!          ")
    print("=======================================")
    for (name, tms) in results:
        print(f"Tiempo total medido (ms) {name}: {tms}")
    print("\nResumen:")
    for (name, tms) in results:
        print(f" - {name}: {tms} ms")

if __name__ == "__main__":
    main()
