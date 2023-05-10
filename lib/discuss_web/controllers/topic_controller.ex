defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Repo

  alias DiscussWeb.Modles.Topic
  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def index(conn,  _params) do
    topics = Repo.all(Topic)
    render(conn, :index, topics: topics)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
