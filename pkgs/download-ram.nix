{ lib
, stdenvNoCC
, fetchFromGitHub
, makeWrapper
, coreutils
, gnugrep
, gawk
, util-linux
}:

stdenvNoCC.mkDerivation rec {
  pname = "download-ram";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "agresdominik";
    repo = "download-ram";
    rev = "v${version}";
    hash = "sha256-N7oQnwl9OiUZsGw+7vrGTdR3XhrVYyv9CIr4CFAYe6M=";
  };

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 download-ram.sh $out/bin/download-ram
    wrapProgram $out/bin/download-ram \
      --prefix PATH : ${lib.makeBinPath [ coreutils gnugrep gawk util-linux ]}

    runHook postInstall
  '';

  meta = {
    description = "Download RAM by creating and enabling a swap file";
    homepage = "https://github.com/agresdominik/download-ram";
    license = lib.licenses.mit;
    mainProgram = "download-ram";
    platforms = lib.platforms.linux;
  };
}
