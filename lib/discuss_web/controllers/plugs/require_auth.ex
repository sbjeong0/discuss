defmodule DiscussWeb.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  use DiscussWeb, :verified_routes #this is key to redirect
  require Logger

  def init(_params) do

  end

  def call(conn, _params) do
    Logger.debug "@@@@@@"
    Logger.debug inspect conn.assigns[:user]
    if conn.assigns[:user] do
      conn
    else
      Logger.debug("@@@@@@")
      conn
      |> put_flash(:error, "You must be logged in")
      |> redirect(to: ~p"/topics")
      |> halt()
    end
  end
end
