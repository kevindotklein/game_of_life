defmodule Game do
  def set_alive(buffer, [], _char), do: buffer

  def set_alive(buffer, [head | tail], char) do
    buffer
    |> List.replace_at(GlobalState.get().width * elem(head, 1) + elem(head, 0), char)
    |> set_alive(tail, char)
  end
end
