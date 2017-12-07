defmodule Gpio do

  require Logger

  alias ElixirALE.GPIO

  @output_pin1 18
  @output_pin2 23
  @output_pin3 24

  def start_blinking() do

    {:ok, output_pid} = GPIO.start_link(@output_pin1, :output)
    spawn fn -> toggle_pin_forever(output_pid, @output_pin1) end

    {:ok, output_pid} = GPIO.start_link(@output_pin2, :output)
    spawn fn -> toggle_pin_forever(output_pid, @output_pin2) end

    {:ok, output_pid} = GPIO.start_link(@output_pin3, :output)
    spawn fn -> toggle_pin_forever(output_pid, @output_pin3) end

  end

  defp toggle_pin_forever(output_pid, pin_number) do
    # Logger.debug "Turning pin #{pin_number} ON"
    GPIO.write(output_pid, 1)
    Process.sleep(500)

    # Logger.debug "Turning pin #{pin_number} OFF"
    GPIO.write(output_pid, 0)
    Process.sleep(500)

    toggle_pin_forever(output_pid, pin_number)
  end

end
