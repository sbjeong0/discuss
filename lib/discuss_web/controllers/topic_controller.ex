defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias DiscussWeb.Modles.Topic
  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, :new, changeset: changeset)
  end
end
