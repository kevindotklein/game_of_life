defmodule Game do
  # [{2, 2}, {3, 3}]

  def toggle_alive(buffer, [], _char), do: buffer

  def toggle_alive(buffer, [head | tail], char) do
    buffer
    |> List.replace_at(GlobalState.get().width * elem(head, 1) + elem(head, 0), char)
    |> toggle_alive(tail, char)
  end
end
