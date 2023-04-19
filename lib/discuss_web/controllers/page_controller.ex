defmodule DiscussWeb.PageController do
  use DiscussWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def test(conn, _params) do
    # :test는 test.html.heex의 파일이름인듯
    render(conn, :test, layout: false)
  end
end
