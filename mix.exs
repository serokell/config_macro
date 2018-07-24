defmodule ConfigMacro.MixProject do
  use Mix.Project

  def project do
    [
      app: :config_macro,
      description: "Macro that defines Application.get_env/{2,3} getters",
      package: [
        files: ["lib", "mix.exs"],
	licenses: ["CC0-1.0"],
	links: %{"GitLab" => "https://gitlab.com/serokell/config_macro"},
	maintainers: ["Yegor Timoshenko"]
      ],
      version: "1.0.0"
    ]
  end
end
