defmodule ConfigMacroTest do
  use ConfigMacro
  use ExUnit.Case

  config :config_macro, foo: 1

  test "defines macro" do
    assert foo() == 1
  end
end
