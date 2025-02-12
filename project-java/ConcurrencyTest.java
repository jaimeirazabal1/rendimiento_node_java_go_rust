import java.util.ArrayList;
import java.util.List;

public class ConcurrencyTest {
    private static final int NUM_THREADS = 10;
    private static final int TASK_LOAD = 100000; // Número de operaciones simuladas

    public static void main(String[] args) {
        long startTime = System.currentTimeMillis();

        List<Thread> threads = new ArrayList<>();

        for (int i = 0; i < NUM_THREADS; i++) {
            Thread t = new Thread(() -> {
                // Simulación de carga de trabajo (por ejemplo, conteo de primos)
                // Aquí hacemos un bucle costoso para emular trabajo intensivo.
                int counter = 0;
                for (int j = 2; j < TASK_LOAD; j++) {
                    if (isPrime(j)) {
                        counter++;
                    }
                }
                // Al final de cada hilo, podríamos imprimir o almacenar un resultado
            });
            threads.add(t);
            t.start();
        }

        // Esperamos a que todos los hilos finalicen
        for (Thread t : threads) {
            try {
                t.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        long endTime = System.currentTimeMillis();
        long totalTime = endTime - startTime;

        System.out.println("Tiempo total (ms) con " + NUM_THREADS + " hilos en Java: " + totalTime);
    }

    // Método para verificar si un número es primo
    private static boolean isPrime(int num) {
        if (num <= 1) return false;
        if (num <= 3) return true;
        if (num % 2 == 0 || num % 3 == 0) return false;
        int i = 5;
        while (i * i <= num) {
            if (num % i == 0 || num % (i + 2) == 0) {
                return false;
            }
            i += 6;
        }
        return true;
    }
}
