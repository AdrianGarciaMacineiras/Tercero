defmodule Echo do

  def  loop() do
    receive do
      {:print, term} ->
        IO.puts(term)
      {:stop, pid} ->
        send pid, {:stop}
      :ok
    end
    loop()
  end


  def start() do
    Process.register(spawn(Echo, :loop, []), :echo)
    :ok
  end

  def stop() do
    send :echo, {:stop, self()}
    receive do
      {:stop} ->
        Process.unregister(:echo)
    end
    :ok
  end

  def print(term) do
    send :echo, {:print, term}
    :ok
  end
end
