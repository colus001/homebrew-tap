class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.2.2/pls-macos-aarch64"
      sha256 "f53050218dcd1cb26b3d4207b52506c77846838dafee9f801d1586f4cb95e88f"
    else
      url "https://github.com/colus001/pls/releases/download/v0.2.2/pls-macos-x86_64"
      sha256 "4019004f176bc6f3dc55acc840b85e01d7a17efc7560c631f2c5c412808ee6e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.2.2/pls-linux-aarch64"
      sha256 "dec0b2ea3b25ab720a07656fc0e487680afa52d36b06a66f47816f077d15a011"
    else
      url "https://github.com/colus001/pls/releases/download/v0.2.2/pls-linux-x86_64"
      sha256 "0cfbbd1af6c559eee99e34751e3ed029f48e3797fd4eef9283df342e31dc8584"
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
