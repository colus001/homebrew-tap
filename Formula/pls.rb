class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.2/pls-macos-aarch64"
      sha256 "63682764c04ed71a012e878cbb17f43db9a6a8a9994e7d5dff9d774eba0b8798"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.2/pls-macos-x86_64"
      sha256 "9611df170802c87c421d20583a78efd4c982b017c1c9dad754a5b2b5170ad15c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.2/pls-linux-aarch64"
      sha256 "3dcfa34261040accc662e96633d786a86db958a959250cf8c76c4cea22ba7379"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.2/pls-linux-x86_64"
      sha256 "8dfc667393eebebbf74b17456b67147b92a0602a0b29e5b9e2821df426665fc7"
    end
  end

  def install
    bin.install Dir["pls-*"].first => "pls"
  end

  def caveats
    <<~EOS
      pls works out of the box with the free tier (no API key needed).

      To get started:
        pls 'hello world'

      To use your own API key for unlimited usage:
        pls init
    EOS
  end

  test do
    assert_match "pls v#{version}", shell_output("#{bin}/pls --version")
  end
end
