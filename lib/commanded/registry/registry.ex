defmodule Commanded.Registry do
  @moduledoc """
  Defines the behaviour for a process registry to be used by Commanded for Aggregates, ProcessManagers, EventHandlers, etc.
  """

  defmacro __using__(_) do
    adapter = Application.get_env(:commanded, :registry_adapter, Commanded.Registry.Adapters.LocalRegistry)

    quote do
      @registry unquote adapter
    end
  end

  @callback register_name(uuid :: term, pid) :: :yes | :no

  @callback send(uuid :: term, msg :: term) :: :ok

  @callback unregister_name(uuid :: term) :: :ok

  @callback whereis_name(uuid :: term) :: pid | :undefined
end
