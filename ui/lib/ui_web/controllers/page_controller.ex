defmodule UiWeb.PageController do
  use UiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def blink(conn, _parms) do
    IO.puts("Blinking")

    Gpio.start_blinking()

    render conn, "blink.html"
  end
end
