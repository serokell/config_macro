defmodule ConfigMacroTest do
  import ConfigMacro
  config __MODULE__, dakkon: 1, morte: 2
  config __MODULE__, [:annah]

  use ExUnit.Case

  test "param returns default" do
    assert dakkon() == 1
  end

  test "param can be overrided" do
    Application.put_env(__MODULE__, __MODULE__, morte: 200)
    assert morte() == 200
  end


  test "param w/o value returns nil" do
    assert annah() == nil
  end
end
