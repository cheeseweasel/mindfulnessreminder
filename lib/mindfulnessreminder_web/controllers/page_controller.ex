defmodule MindfulnessreminderWeb.PageController do
  use MindfulnessreminderWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
