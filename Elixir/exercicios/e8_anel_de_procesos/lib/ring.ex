defmodule Ring do

  def start(n, m, msg) do
    #IO.inspect binding(), label: "0"
    pid = spawn_link(Ring, :start_process, [n-1])
    send pid, {m, msg}
  end

  def start_process(count) do
    #IO.inspect binding(), label: "1"
    pid = spawn_link(Ring, :start_process, [count-1,  self()])
    loop(pid)
  end

  def start_process(0, last) do
    #IO.inspect binding(), label: "2"
    loop(last)
  end

  def start_process(count, last) do
    #IO.inspect binding(), label: "3"
    pid = spawn_link(Ring, :start_process, [count-1, last])
    loop(pid)
  end

  def loop(next_pid) do
    #IO.inspect binding(), label: "4"
    receive do
      {1, msg} ->
        #IO.inspect binding(), label: "5"
        #IO.puts "#{inspect self()} shutting down. next_pid: #{inspect next_pid}."
        send(next_pid, {0, msg})
        :ok
      {m, msg} ->
        #IO.inspect binding(), label: "6"
        #IO.puts "m: #{m}. self: #{inspect self()}. next_pid: #{inspect next_pid}."
        send(next_pid, {m-1, msg})
        loop(next_pid)
    end
  end
end
