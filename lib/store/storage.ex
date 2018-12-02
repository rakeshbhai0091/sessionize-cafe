defmodule Store.Storage do
  def create(data) do
    {:ok, pid} = Agent.start_link(fn -> data end)
    Coder.encode_from_pid(pid)
  end

  def get(code_pair) do
    Coder.decode_to_pid(code_pair)
    |> Agent.get(fn data -> data end)
  end

end

