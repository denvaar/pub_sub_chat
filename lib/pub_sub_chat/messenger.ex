defmodule PubSubChat.Messenger do
  @pubsub_name :messages
  @topic "general"

  def send_message(message) do
    Phoenix.PubSub.broadcast(@pubsub_name, @topic, {:new_message, message})
  end
end
