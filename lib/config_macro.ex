defmodule ConfigMacro do
  defmacro __using__([]) do
    quote do: import unquote(__MODULE__)
  end

  defp normalize_param({k, v}), do: {k, v}
  defp normalize_param(k) when is_atom(k), do: {k, nil}

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
