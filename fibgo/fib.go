package main

import (
    "fmt"
    "time"
)

// fib is a pure, recursive function to calculate the Nth Fibonacci number.
// We use the standard 'int' type, which is usually 64-bit on modern systems,
// sufficient to hold the result for N=40.
func fib(n int) int {
    if n <= 1 {
        return n
    }
    // Recursive calls
    return fib(n-1) + fib(n-2)
}

func main() {
    // --- Configuration ---
    // Choose a value for N, consistent with the other benchmarks.
    const n = 40

    // --- Benchmarking ---
    // Start timing using time.Now().
    start := time.Now()

    // Calculate the Fibonacci number.
    result := fib(n)

    // Calculate the duration since 'start'.
    elapsed := time.Since(start)

    // Convert duration to milliseconds for comparison.
    elapsed_ms := float64(elapsed.Microseconds()) / 1000.0

    // --- Output ---
    fmt.Println("--- Go Recursive Fibonacci Benchmark ---")
    fmt.Println("N:", n)
    fmt.Println("Result:", result)
    fmt.Printf("Time to calculate: %.3f ms\n", elapsed_ms)
    fmt.Println("--------------------------------------")
}

