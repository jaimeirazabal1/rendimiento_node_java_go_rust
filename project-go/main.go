package main

import (
    "fmt"
    "runtime"
    "sync"
    "time"
)

const (
    NUM_GOROUTINES = 10
    TASK_LOAD      = 100000 // Rango en el que validamos números primos
)

// isPrime comprueba si un número es primo
func isPrime(num int) bool {
    if num <= 1 {
        return false
    }
    if num <= 3 {
        return true
    }
    if num%2 == 0 || num%3 == 0 {
        return false
    }
    i := 5
    for i*i <= num {
        if num%i == 0 || num%(i+2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

func main() {
    // Para ver cuántos CPUs estamos usando
    fmt.Println("CPUs disponibles:", runtime.NumCPU())

    start := time.Now()

    var wg sync.WaitGroup
    wg.Add(NUM_GOROUTINES)

    for i := 0; i < NUM_GOROUTINES; i++ {
        go func() {
            defer wg.Done()
            count := 0
            for j := 2; j < TASK_LOAD; j++ {
                if isPrime(j) {
                    count++
                }
            }
        }()
    }

    wg.Wait()

    elapsed := time.Since(start)
    fmt.Printf("Tiempo total (ms) con %d goroutines en Go: %d\n",
        NUM_GOROUTINES, elapsed.Milliseconds())
}
