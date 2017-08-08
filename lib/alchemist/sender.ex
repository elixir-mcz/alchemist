defmodule Alchemist.sender do
  @moduledoc """
  Documentation for send Alchemist.
  """

  @doc """
    sender for alchemist

  ## Examples

      iex> Alchemist.sender.start function, size

  """

  def start(f, target, size) when is_function(f) do

    total_process = :erlang.system_info(:process_limit) - (:erlang.system_info(:process_count)+100)

    Enum.map(0..total_process, fn(n) ->
            spawn fn -> f.(target, size) end
        end)
  end
end
