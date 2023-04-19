defmodule DiscussWeb.TopicHTML do
  use DiscussWeb, :html

  embed_templates "topic_html/*"

  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  def topic_form(assigns) do
    ~H"""
    <input style='background-color: red' />
    """
  end
end
