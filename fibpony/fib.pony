use "time"

actor Main
  // The program entry point.
  new create(env: Env) =>
    // --- Configuration ---
    // Choose a value for N that is large enough to show a measurable time,
    // but not so large that it takes too long (e.g., 40 is usually good for recursive fibonacci).
    let n: U64 = 40

    // --- Benchmarking ---
    // Start timing using nanoseconds for high precision.
    let start_time: U64 = Time.nanos()

    // Calculate the Fibonacci number.
    let result: U64 = fib(n)

    // Stop timing and calculate duration.
    let end_time: U64 = Time.nanos()
    let elapsed_ns: U64 = end_time - start_time

    // Convert nanoseconds to milliseconds for readability.
    let elapsed_ms: F64 = elapsed_ns.f64() / 1_000_000.0

    // --- Output ---
    env.out.print("--- Pony Recursive Fibonacci Benchmark ---")
    env.out.print("N: " + n.string())
    env.out.print("Result: " + result.string())
    env.out.print("Time to calculate: " + elapsed_ms.string() + " ms")
    env.out.print("------------------------------------------")

  // A pure, recursive function to calculate the Nth Fibonacci number.
  // 'fun box' indicates a function that cannot read or write the actor's fields,
  // making it a safe, pure computation.
  fun box fib(n: U64): U64 =>
    if n <= 1 then
      n
    else
      // Recursive calls
      fib(n - 1) + fib(n - 2)
    end

// Makefile sets some options, but could be set from inside code:    
//  fun @runtime_override_defaults(rto: RuntimeOptions) =>
//    rto.ponynoblock = true
//    rto.ponymaxthreads = 1
