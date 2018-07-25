with import <nixpkgs> {};

stdenvNoCC.mkDerivation {
  name = "config_macro";
  buildInputs = [ elixir ];

  shellHook = ''
    mix local.hex --force
    mix deps.get
  '';
}
