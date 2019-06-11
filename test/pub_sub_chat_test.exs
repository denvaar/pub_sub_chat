defmodule PubSubChatTest do
  use ExUnit.Case
  doctest PubSubChat

  test "greets the world" do
    assert PubSubChat.hello() == :world
  end
end
