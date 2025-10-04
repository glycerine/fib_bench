import 'dart:io';

// A pure, recursive function to calculate the Nth Fibonacci number.
// We use int for simplicity, as U64 in Pony is comparable to Dart's 64-bit int.
// For N=40, the result (102,334,155) fits well within a standard 64-bit integer.
int fib(int n) {
  if (n <= 1) {
    return n;
  }
  // Recursive calls
  return fib(n - 1) + fib(n - 2);
}

void main() {
  // --- Configuration ---
  // Choose a value for N, matching the Pony benchmark.
  const int n = 40;

  // --- Benchmarking ---
  // Use a Stopwatch for high-resolution timing.
  final Stopwatch stopwatch = Stopwatch()..start();

  // Calculate the Fibonacci number.
  final int result = fib(n);

  // Stop timing.
  stopwatch.stop();

  // Calculate duration in milliseconds.
  // We use microseconds for better precision before conversion.
  final double elapsed_ms = stopwatch.elapsedMicroseconds / 1000.0;

  // --- Output ---
  stdout.writeln("--- Dart Recursive Fibonacci Benchmark ---");
  stdout.writeln("N: $n");
  stdout.writeln("Result: $result");
  stdout.writeln("Time to calculate: ${elapsed_ms.toStringAsFixed(3)} ms");
  stdout.writeln("------------------------------------------");
}

