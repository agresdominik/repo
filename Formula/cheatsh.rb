class Cheatsh < Formula
  desc    "a terminal cheat sheet for linux"
  homepage "https://github.com/agresdominik/cheat_sheet"
  version "0.1.2"
  url     "https://github.com/agresdominik/cheat_sheet/archive/refs/tags/v0.1.2.tar.gz"
  sha256  "b6df830340da71fbe85d972c82432479f8c4d45f821cad489c6ef2e719d88152"
  license "GPL-3.0"                                      

  depends_on "go" => :build

  def install
    system "make", "install",
        "PREFIX=#{prefix}",
        "SYSCONFDIR=#{etc}/cheatsh"
  end

  def post_install
    config_dir = "#{Dir.home}/.config/cheatsh"
    FileUtils.mkdir_p config_dir

    ["commands.json", "commands_template.json"].each do |f|
      src  = "#{etc}/cheatsh/#{f}"
      dest = "#{config_dir}/#{f}"
      FileUtils.cp(src, dest)
    end
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
