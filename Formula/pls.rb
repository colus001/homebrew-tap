class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.1/pls-macos-aarch64"
      sha256 "d35f5480d892fe52da7c9bb7275cd35d6e0e97659bab6bd90b0b2e30a3d52b7e"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.1/pls-macos-x86_64"
      sha256 "a64c2365c04a19110c43f30c33d0af03e9c37a933e69e087940c87b4faa0f76c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.1/pls-linux-aarch64"
      sha256 "197dcf12d3c2a1f3de2a867ff1a004d480ebf02576173f037a751f611fb25e31"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.1/pls-linux-x86_64"
      sha256 "bf6ef5741d73fad6338a80c72e7322743336f4b7da77ebf584d970d20305b60f"
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
