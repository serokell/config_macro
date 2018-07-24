with import <nixpkgs> {};

stdenvNoCC.mkDerivation {
  name = "config_macro";
  buildInputs = [ elixir ];
}
