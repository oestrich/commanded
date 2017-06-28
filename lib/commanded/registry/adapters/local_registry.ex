defmodule Commanded.Registry.Adapters.LocalRegistry do
  @moduledoc """
  Default registry wrapping Elixir's builtin Registry module.
  """

  @behaviour Commanded.Registry
  @registry_name :commanded_registry



  def register_name(uuid, pid) do
    Registry.register_name({@registry_name, uuid}, pid)
  end

  def send(uuid, msg) do
    Registry.send({@registry_name, uuid}, msg)
  end

  def unregister_name(uuid) do
    Registry.unregister_name({@registry_name, uuid})
  end

  def whereis_name(uuid) do
    Registry.whereis_name({@registry_name, uuid})
  end
end
