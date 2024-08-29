Code.require_file("lib/global/global_state.ex")
Code.require_file("lib/tui/tui.ex")
Code.require_file("lib/game/game.ex")

defmodule GameOfLife do
  def run do
    screen = %Tui.Screen{width: 15, height: 15, mode: :mono}
    cursor = %Tui.Cursor{x: 2, y: 2}
    alive_cells = [{3, 2}, {2, 9}]

    {:ok, _pid} = GlobalState.start_link(screen)

    buffer = Game.set_alive(Tui.create_buffer(), alive_cells, "#")

    # intro msg and socials

    :timer.send_interval(750, self(), :tick)

    loop(buffer, cursor)
  end

  defp loop(buffer, cursor) do
    receive do
      :tick ->
        Tui.display(buffer, cursor)
        # game run (using Game.set_alive())
        loop(buffer, cursor)
    end
  end
end

GameOfLife.run()
