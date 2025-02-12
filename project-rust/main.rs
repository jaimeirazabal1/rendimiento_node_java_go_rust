use std::time::Instant;
use std::thread;

// Configuraciones
const NUM_THREADS: usize = 10;
const TASK_LOAD: i32 = 100_000;

// Función para chequear primos
fn is_prime(num: i32) -> bool {
    if num <= 1 {
        return false;
    }
    if num <= 3 {
        return true;
    }
    if num % 2 == 0 || num % 3 == 0 {
        return false;
    }
    let mut i = 5;
    while i * i <= num {
        if num % i == 0 || num % (i + 2) == 0 {
            return false;
        }
        i += 6;
    }
    true
}

fn main() {
    let start = Instant::now();

    // Creamos un vector para manejar los handles de cada hilo
    let mut handles = vec![];

    for _ in 0..NUM_THREADS {
        // Creamos hilos
        let handle = thread::spawn(|| {
            let mut counter = 0;
            for j in 2..TASK_LOAD {
                if is_prime(j) {
                    counter += 1;
                }
            }
            counter
        });
        handles.push(handle);
    }

    // Esperamos a que los hilos terminen
    for handle in handles {
        // Recogemos el valor del hilo
        let _res = handle.join().unwrap();
        // Podríamos imprimir _res si quisiéramos ver el conteo total
    }

    let duration = start.elapsed();
    println!(
        "Tiempo total (ms) con {} threads en Rust: {}",
        NUM_THREADS,
        duration.as_millis()
    );
}
