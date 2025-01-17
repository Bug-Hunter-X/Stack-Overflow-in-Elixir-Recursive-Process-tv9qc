The solution addresses the stack overflow by using tail recursion or message passing:

**Tail Recursion:**

```elixir
defmodule RecursiveProcess do
  def start_link(count) do
    spawn(fn -> loop(count, :ok) end)
  end

  defp loop(0, acc) do
    acc
  end

  defp loop(count, acc) do
    IO.puts("Count: #{count}")
    loop(count - 1, :ok)
  end
 end

RecursiveProcess.start_link(5)
```

**Message Passing:**

```elixir
defmodule RecursiveProcess do
  def start_link(count) do
    pid = spawn(fn -> loop() end)
    send(pid, {:count, count})
    receive do
      {:done} -> :ok
    end
  end

  defp loop() do
    receive do
      {:count, 0} -> send(self(), {:done})
      {:count, count} ->
        IO.puts("Count: #{count}")
        send(self(), {:count, count - 1})
        loop()
    end
  end
 end

RecursiveProcess.start_link(5)
```

Tail recursion allows the compiler to optimize the recursive calls, avoiding the accumulation of stack frames. Message passing avoids deep recursion altogether by using processes to communicate data.