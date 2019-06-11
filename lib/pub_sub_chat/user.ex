defmodule PubSubChat.Cat do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    Phoenix.PubSub.subscribe(:messages, "general")
    {:ok, []}
  end

  def handle_info({:new_message, message}, message_log) do
    IO.puts("Meow.. I just got this meow message: #{message}")

    {:noreply, [message | message_log]}
  end
end
