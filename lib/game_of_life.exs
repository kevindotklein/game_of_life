Code.require_file("lib/tui/tui.ex")

defmodule GameOfLife do
  def run do
    screen = %Tui.Screen{width: 20, height: 20, mode: :mono}

    :timer.send_interval(1000, self(), :tick)

    loop(screen)
  end

  defp loop(%Tui.Screen{} = screen) do
    receive do
      :tick ->
        Tui.display(screen)
        loop(screen)
    end
  end
end

GameOfLife.run()
