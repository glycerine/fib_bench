fib_bench: dumb but fun recursive fibonacci in Zig, Pony, Go, and Dart
==============

Results ordered from fastest to slowest.

Conversely, ordered from the least amount of runtime flexibility 
to the most (Dart bytecode bulid even has hot code reload).

# Zig
~~~
$ zig build-exe fib.zig -O ReleaseFast
$ ./fib 
--- Zig Recursive Fibonacci Benchmark ---
N: 40
Result: 102334155
Time to calculate: 256.821 ms
--------------------------------------
~~~

# Pony
~~~
$ ponyc
$ ./fibpony --ponynoyield --ponypin --ponymaxthreads 1
--- Pony Recursive Fibonacci Benchmark ---
N: 40
Result: 102334155
Time to calculate: 266.193 ms
------------------------------------------

$ ponyc
$ ./fibpony 
--- Pony Recursive Fibonacci Benchmark ---
N: 40
Result: 102334155
Time to calculate: 288.189 ms
------------------------------------------
~~~

# Go
~~~
$ go build -buildvcs=false
$ ./fibgo
--- Go Recursive Fibonacci Benchmark ---
N: 40
Result: 102334155
Time to calculate: 505.017 ms
--------------------------------------
~~~

# Dart
~~~
$ dart compile exe fib.dart 
$ ./fib.exe
--- Dart Recursive Fibonacci Benchmark ---
N: 40
Result: 102334155
Time to calculate: 514.411 ms
------------------------------------------

$ dart run fib.dart  # run as byte-code with hot-code reload available
--- Dart Recursive Fibonacci Benchmark ---
N: 40
Result: 102334155
Time to calculate: 590.959 ms
------------------------------------------

~~~

------

Copyright (c) 2025 Jason E. Aten, Ph.D. All rights reserved.

LICENSE: MIT
