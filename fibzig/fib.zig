const std = @import("std");

// fib is a pure, recursive function to calculate the Nth Fibonacci number.
// We use u64 (unsigned 64-bit integer) to ensure the result is correctly typed.
fn fib(n: u64) u64 {
    if (n <= 1) {
        return n;
    }
    // Recursive calls
    return fib(n - 1) + fib(n - 2);
}

// The main function returns !void, indicating it might throw an error (e.g., during I/O).
pub fn main() !void {
    // --- Configuration ---
    // Choose a value for N, consistent with the other benchmarks.
    const n: u64 = 40;

    // Get a writer for standard output, handling potential writer errors with `!`.
    //const stdout = std.fs.File.stdout();

    // --- Benchmarking ---
    // Start timing using the high-resolution nanoTimestamp.
    const start_nanos = std.time.nanoTimestamp();

    // Calculate the Fibonacci number.
    const result = fib(n);

    // Calculate the duration.
    const end_nanos = std.time.nanoTimestamp();
    const elapsed_nanos: f64 = @floatFromInt(end_nanos - start_nanos);

    // Convert duration to milliseconds (1,000,000 nanoseconds per millisecond).
    const elapsed_ms: f64 = elapsed_nanos / 1_000_000.0;

    // --- Output ---
    const print = @import("std").debug.print;
    print("--- Zig Recursive Fibonacci Benchmark ---\n", .{});
    print("N: {}\n", .{n});
    print("Result: {}\n", .{result});
    // Use the {d:.3} format specifier to print the float with 3 decimal places.
    print("Time to calculate: {d:.3} ms\n", .{elapsed_ms});
    print("--------------------------------------\n", .{});
}

