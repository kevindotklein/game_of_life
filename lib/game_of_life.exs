Code.require_file("lib/global/global_state.ex")
Code.require_file("lib/tui/tui.ex")
Code.require_file("lib/game/game.ex")

defmodule GameOfLife do
  def run do
    screen = %Tui.Screen{width: 40, height: 20, mode: :mono}

    {:ok, _pid} = GlobalState.start_link(screen)

    buffer = Tui.create_buffer()

    # intro msg and socials

    :timer.send_interval(750, self(), :tick)

    loop(buffer)
  end

  defp loop(buffer) do
    receive do
      :tick ->
        Tui.display(buffer)
        loop(Game.toggle_alive(buffer, [{2, 2}], "#"))
    end
  end
end

GameOfLife.run()
