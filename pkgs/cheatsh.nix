{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "cheatsh";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "agresdominik";
    repo = "cheat_sheet";
    rev = "v${version}";
    hash = "sha256-oooakiioqOW5MrpfBDR4FY1svFQktMD4k96+EXy4BHY=";
  };

  vendorHash = "sha256-gpUX3Wa6JtJTlxIoW0kj9tG/JmpbTSNCW0lTS7sSoZI=";

  subPackages = [ "src" ];

  postInstall = ''
    mv $out/bin/src $out/bin/cheatsh
    mkdir -p $out/share/cheatsh
    cp data/commands.json data/commands_template.json $out/share/cheatsh/
  '';

  meta = {
    description = "Terminal cheat sheet TUI for commands you keep forgetting";
    homepage = "https://github.com/agresdominik/cheat_sheet";
    license = lib.licenses.gpl3Only;
    mainProgram = "cheatsh";
    platforms = lib.platforms.linux;
  };
}
