defmodule Tui do
  defmodule Screen do
    defstruct width: 20, height: 20, mode: :mono
  end

  def display(%Screen{} = screen)
      when is_number(screen.width) and is_number(screen.height) do
    buffer = List.duplicate(0, screen.width * screen.height)
    print_buffer(screen, buffer, 0)
  end

  defp print_buffer(%Screen{} = _screen, [], _count), do: :ok

  defp print_buffer(%Screen{} = screen, [head | tail], count) do
    IO.write("#{head}")

    if rem(count + 1, screen.width) == 0 do
      IO.puts("")
    end

    print_buffer(screen, tail, count + 1)
  end
end
