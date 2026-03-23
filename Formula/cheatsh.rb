class Myapp < Formula
  desc    "a terminal cheat sheet for linux"
  homepage "https://github.com/agresdominik/cheat_sheet"
  url     "https://github.com/agresdominik/cheat_sheet/archive/refs/tags/v#{version}.tar.gz"
  version "0.0.1"                                    
  sha256  "TODO_SHA256"                              # run: curl -sL <url> | sha256sum
  license "GPL-3.0"                                      

  depends_on "go" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      Default config files are stored in:
        #{etc}/cheatsh/
 
      To set up your config on first run:
        cp #{etc}/cheatsh/commands_template.json ~/.config/cheatsh/
    EOS
  end

  test do
    system "#{bin}/myapp", "--help"              
  end
end
