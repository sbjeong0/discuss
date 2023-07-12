defmodule DiscussWeb.Models.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:content]}

  schema "comments" do
    field :content, :string
    belongs_to :user, DiscussWeb.Accounts.User
    belongs_to :topic, DiscussWeb.Discussions.Topic

    timestamps()
    end

    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:content])
      |> validate_required([:content])
    end
end
