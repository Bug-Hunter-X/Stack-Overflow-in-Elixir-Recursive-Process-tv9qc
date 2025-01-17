# Elixir Recursive Process Bug

This repository demonstrates a common error in Elixir: stack overflow due to unbounded recursion within a single process. The example uses a simple recursive function that counts down from a given number.  While seemingly straightforward, this will crash with a stack overflow for large numbers because it's not tail-recursive.

## How to reproduce

1. Clone the repository.
2. Run `mix run recursive_process_bug.ex`.
3. Observe the stack overflow error for large input numbers.

## Solution

The provided solution in `recursive_process_solution.ex` demonstrates correct implementation using tail recursion or message passing to avoid this issue.