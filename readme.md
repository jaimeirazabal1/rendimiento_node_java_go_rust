
# 🏆 La Gran Batalla de la Concurrencia: Java vs Node.js vs Go vs Rust 🚀  

Este proyecto evalúa el rendimiento de **concurrencia** en **Java**, **Node.js**, **Go** y **Rust** utilizando **Docker**. Cada lenguaje ejecuta un cálculo intensivo de CPU (verificación de números primos) de forma paralela y se mide el tiempo total de ejecución.

## 📌 Tecnologías utilizadas  
- **Java** (Threads)  
- **Node.js** (Worker Threads)  
- **Go** (Goroutines)  
- **Rust** (Threads nativos)  
- **Docker** (para aislar cada ejecución)  
- **Python** (para ejecutar las pruebas y medir tiempos)  

## 📊 Resultados obtenidos  
Estos son los resultados de la última ejecución en **Docker**:

| Lenguaje  | Tiempo Total (ms) |
|-----------|------------------|
| Java      | 360 ms           |
| Node.js   | 561 ms           |
| Go        | 164 ms           |
| Rust      | 185 ms           |

🔹 **Go y Rust fueron los más rápidos**, destacando por su eficiente gestión de concurrencia.  
🔹 **Java** sigue siendo una opción robusta, aunque con algo más de overhead.  
🔹 **Node.js**, a pesar de ser eficiente en muchas tareas, muestra mayores tiempos en cálculos CPU-bound.  

## 🚀 Cómo ejecutar las pruebas  

### 1️⃣ Clonar el repositorio  
```bash
git clone https://github.com/jaimeirazabal1/rendimiento_node_java_go_rust
cd benchmark-concurrency
```

### 2️⃣ Construir y ejecutar todas las pruebas  
Ejecuta el script **Python** que automatiza la construcción y ejecución de los contenedores:  
```bash
python3 run_all_tests.py
```

Este script:  
✅ Construye cada imagen Docker (`docker build`)  
✅ Ejecuta cada contenedor (`docker run`)  
✅ Mide el tiempo de ejecución de cada lenguaje  
✅ Muestra los resultados finales en la terminal  

### 3️⃣ Ejecutar manualmente cada lenguaje (opcional)  
Si quieres ejecutar cada prueba por separado:

#### **Java**  
```bash
cd project-java
docker build -t java-concurrency-test .
docker run --rm java-concurrency-test
```

#### **Node.js**  
```bash
cd project-js
docker build -t js-concurrency-test .
docker run --rm js-concurrency-test
```

#### **Go**  
```bash
cd project-go
docker build -t go-concurrency-test .
docker run --rm go-concurrency-test
```

#### **Rust**  
```bash
cd project-rust
docker build -t rust-concurrency-test .
docker run --rm rust-concurrency-test
```

## 📜 Explicación del Benchmark  
Cada aplicación en **Java, Node.js, Go y Rust** ejecuta un cálculo intensivo de CPU: **verificación de números primos**.  
Se lanzan **10 hilos, workers o goroutines** que realizan el mismo cálculo en paralelo.  

🔹 **Java** usa `Threads`  
🔹 **Node.js** usa `Worker Threads`  
🔹 **Go** usa `Goroutines`  
🔹 **Rust** usa `std::thread` para crear hilos nativos  

El tiempo total de ejecución se mide dentro de cada contenedor y también con el script Python, que contabiliza desde que el contenedor se inicia hasta que finaliza.

## 🎯 Conclusiones  
- **Go y Rust sobresalen en tareas CPU-bound**, con la menor latencia en esta prueba.  
- **Java sigue siendo fuerte**, pero puede verse afectado por el overhead de la JVM.  
- **Node.js, aunque poderoso en I/O, muestra un mayor tiempo en cálculos pesados** debido a su modelo de hilos basado en `worker_threads`.  

### 📌 Moraleja  
> “No hay un ganador absoluto: **cada lenguaje brilla en distintos escenarios**. Si tu carga de trabajo es intensiva en CPU, **Go y Rust pueden ser la mejor opción**. Para aplicaciones empresariales, **Java sigue siendo confiable**. Y si el trabajo es más I/O intensivo, **Node.js puede destacar**.”  

---

## 🛠 Mejoras futuras  
✅ Añadir pruebas para tareas I/O-bound  
✅ Implementar **multi-containers con Docker Compose**  
✅ Agregar métricas de uso de CPU y memoria  

---

## 🤝 Contribuir  
Si quieres mejorar este benchmark, siéntete libre de hacer un **fork** y enviar un **pull request**.  

📩 Contáctame en: [tu-email@example.com](mailto:tu-email@example.com)  

---

🚀 **¡Que comience la batalla de la concurrencia!** 🚀  
