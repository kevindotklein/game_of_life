defmodule Tui do
  defmodule Screen do
    defstruct width: 20, height: 20, mode: :mono
  end

  def display(buffer) do
    clear_screen()
    print_buffer(buffer, 0)
  end

  def create_buffer(),
    do: List.duplicate(".", GlobalState.get().width * GlobalState.get().height)

  defp print_buffer([], _count), do: :ok

  defp print_buffer([head | tail], count) do
    IO.write("#{head}")

    if rem(count + 1, GlobalState.get().width) == 0 do
      IO.puts("")
    end

    print_buffer(tail, count + 1)
  end

  defp clear_screen do
    IO.write("\e[H\e[2J")
  end
end
