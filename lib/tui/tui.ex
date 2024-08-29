defmodule Tui do
  defmodule Screen do
    defstruct width: 10, height: 10, mode: :mono
  end

  defmodule Cursor do
    defstruct x: 0, y: 0
  end

  def display(buffer, %Cursor{} = cursor) do
    clear_screen()
    print_buffer(buffer, cursor, 0)
  end

  def create_buffer(),
    do: List.duplicate(".", GlobalState.get().width * GlobalState.get().height)

  defp print_buffer([], _cursor, _count), do: :ok

  defp print_buffer([head | tail], cursor, count) do
    # if cursor replace spaces with []
    # if cursor x and y == count

    if GlobalState.get().width * cursor.y + cursor.x == count do
      IO.write("[#{head}]")
    else
      IO.write(" #{head} ")
    end

    if rem(count + 1, GlobalState.get().width) == 0 do
      IO.puts("")
    end

    print_buffer(tail, cursor, count + 1)
  end

  defp clear_screen do
    IO.write("\e[H\e[2J")
  end
end
