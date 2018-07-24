with import <nixpkgs> {};

stdenvNoCC.mkDerivation {
  name = "configear";
  buildInputs = [ elixir ];
}
