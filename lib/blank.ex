defmodule Vanilla do
  use GenServer
  require Logger

  def get() do
    GenServer.call(Vanilla, :get)
  end

  def start_link do
    IO.puts ""
    IO.puts "-----------------"
    IO.puts "Starting Vanilla..."
    IO.puts "-----------------"
    IO.puts ""
    IO.puts "type 'Vanilla.get()' to fetch latest number."
    IO.puts ""
    GenServer.start_link(__MODULE__, nil, name: Vanilla)
  end

  def init(_state) do
    Process.send_after(self(), :update, 10000)
    {:ok, 1}
  end

  def handle_call(:get, _from, number) do
    IO.puts "Current Number is #{number}, #{Timex.now()}"
    {:reply, {:ok, number}, number}
  end

  def handle_info(:update, number) do
    number = number + 1
    IO.puts "Hello World #{number}, #{Timex.now()}"
    Process.send_after(self(), :update, 10000)
    {:noreply, number}
  end

end
