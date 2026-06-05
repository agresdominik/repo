class DownloadRam < Formula
  desc    "Download RAM by creating and enabling a swap file"
  homepage "https://github.com/agresdominik/download-ram"
  version "0.2.0"
  url     "https://github.com/agresdominik/download-ram/archive/refs/tags/v0.2.0.tar.gz"
  sha256  "05df6ccebbb05a6d876ffec1c0b3ddac97b649ea6ca680f64cc04ba92608205e"
  license "MIT"

  on_linux do
    depends_on "util-linux"
  end

  def install
    bin.install "download-ram.sh" => "download-ram"
  end

  test do
    assert_predicate bin/"download-ram", :exist?
  end
end
