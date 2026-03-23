class Cheatsh < Formula
  desc    "a terminal cheat sheet for linux"
  homepage "https://github.com/agresdominik/cheat_sheet"
  version "0.1.0"                                    
  url     "https://github.com/agresdominik/cheat_sheet/archive/refs/tags/v#{version}.tar.gz"
  sha256  "377e949fcb2614ca1e25add3db6d27f221bec655179a323219535068d8185204"                              
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
