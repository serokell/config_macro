defmodule ConfigMacro.Option do
  def to_atom({k, _v}), do: k
  def to_atom(k) when is_atom(k), do: k

  def to_list({k, v}), do: [k, v]
  def to_list(k) when is_atom(k), do: [k]
end
