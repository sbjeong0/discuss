defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  def new(conn, _params) do
    json(conn, "hello")
  end
end
