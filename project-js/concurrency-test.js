const { Worker, isMainThread, parentPort, workerData } = require('worker_threads');

// Configuraciones
const NUM_WORKERS = 10;
const TASK_LOAD = 100000; // Número de operaciones simuladas

// Función para comprobar números primos
function isPrime(num) {
  if (num <= 1) return false;
  if (num <= 3) return true;
  if (num % 2 === 0 || num % 3 === 0) return false;
  let i = 5;
  while (i * i <= num) {
    if (num % i === 0 || num % (i + 2) === 0) {
      return false;
    }
    i += 6;
  }
  return true;
}

if (isMainThread) {
  // Medimos el tiempo de ejecución
  const startTime = Date.now();
  let completed = 0;

  for (let i = 0; i < NUM_WORKERS; i++) {
    const worker = new Worker(__filename, {
      workerData: { TASK_LOAD }
    });
    
    worker.on('message', () => {
      completed++;
      if (completed === NUM_WORKERS) {
        const endTime = Date.now();
        console.log(`Tiempo total (ms) con ${NUM_WORKERS} workers en Node.js: ${endTime - startTime}`);
      }
    });
  }
} else {
  // Trabajo intensivo (en un worker thread)
  let counter = 0;
  for (let j = 2; j < workerData.TASK_LOAD; j++) {
    if (isPrime(j)) {
      counter++;
    }
  }

  // Avisamos al hilo principal que hemos terminado
  parentPort.postMessage({ done: true });
}
