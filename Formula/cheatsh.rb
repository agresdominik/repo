class Cheatsh < Formula
  desc     "Terminal cheat sheet TUI for commands you keep forgetting"
  homepage "https://github.com/agresdominik/cheat_sheet"
  version "0.1.2"
  url     "https://github.com/agresdominik/cheat_sheet/archive/refs/tags/v0.1.3.tar.gz"
  sha256  "1d5a26d290fe40518abc65698bd7dee028d80339680eb8249e8e632b740991e4"
  license "GPL-3.0-only"                                      

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"cheatsh"), "./src"
    pkgshare.install "data/commands.json", "data/commands_template.json"
  end

  def caveats
    <<~EOS
      cheatsh uses the bundled command list by default (updated on `brew upgrade`):
        #{opt_pkgshare}/commands.json

      To use your own list, copy the template and pass it explicitly:
        cp #{opt_pkgshare}/commands_template.json ~/my-commands.json
        cheatsh --config ~/my-commands.json

      Copying to the clipboard needs a backend on Linux:
        wl-clipboard (Wayland) or xsel / xclip (X11). macOS works out of the box.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cheatsh --help")
  end
end
