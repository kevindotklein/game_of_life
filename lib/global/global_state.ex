defmodule GlobalState do
  def start_link(state) do
    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def get do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def set_screen(screen) do
    Agent.update(__MODULE__, fn _state -> screen end)
  end
end
