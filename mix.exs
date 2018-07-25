defmodule ConfigMacro.MixProject do
  use Mix.Project

  def project do
    [
      app: :config_macro,
      deps: [{:ex_doc, "~> 0.18", only: :dev, runtime: false}],
      description: "Macro that defines Mix.Config.config/3 compatible getters",
      package: [
        files: ["lib", "mix.exs"],
	licenses: ["CC0-1.0"],
	links: %{"GitLab" => "https://gitlab.com/serokell/config_macro"},
	maintainers: ["Yegor Timoshenko"]
      ],
      version: "0.1.0"
    ]
  end
end
