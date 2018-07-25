defmodule ConfigMacro do
  @moduledoc """
  Contains `config/2` macro that defines module-namespaced
  `Application.get_env/3` getters. Supposed to complement
  `Mix.Config.config/3` macro.

  Minimal usage example:

  ```
  # lib/zelda/link.ex
  defmodule Zelda.Link do
    import ConfigMacro
    config :zelda, health: 100, weapon: "Tree Branch"
  end
  ```

  ```
  # config/config.exs
  use Mix.Config

  config :zelda, Zelda.Link, weapon: "Kokiri Sword"
  ```

  ```
  $ iex -S mix
  iex(1)> Zelda.Link.health
  100
  iex(2)> Zelda.Link.weapon
  "Kokiri Sword"
  ```
  """

  defmacro __using__([]) do
    quote do: import unquote(__MODULE__)
  end

  defp normalize_param({k, v}), do: {k, v}
  defp normalize_param(k) when is_atom(k), do: {k, nil}

  @doc """
  Defines getters for the given params.

  `app` is an atom with OTP application name.

  `params` is a list of atoms (for keys without default value) and/or
  `{:key, "default_value"}` tuples.
  """
  defmacro config(app, params) do
    for param <- params do
      {key, value} = normalize_param(param)
      quote do
        def unquote(key)() do
          unquote(app)
	  |> Application.get_env(__MODULE__, [])
	  |> Keyword.get(unquote(key), unquote(value))
	end
      end
    end
  end
end
