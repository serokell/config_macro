alias ConfigMacro.Option

defmodule ConfigMacro do
  defmacro __using__([]) do
    quote do: import unquote(__MODULE__)
  end

  defmacro config(app, options) do
    for option <- options do
      quote do
        def unquote(Option.to_atom(option))() do
          unquote(app)
	  |> Application.get_env(__MODULE__, [])
	  |> Keyword.get(unquote_splicing(Option.to_list(option)))
	end
      end
    end
  end
end
