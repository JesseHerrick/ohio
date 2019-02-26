defmodule OhioWeb.PageController do
  use OhioWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
