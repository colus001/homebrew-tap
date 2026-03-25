class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.2.1/pls-macos-aarch64"
      sha256 "62c02337c57a0e0c4b27c07251f12c7e56cbd0e9a137a5f55ae063b09f40e116"
    else
      url "https://github.com/colus001/pls/releases/download/v0.2.1/pls-macos-x86_64"
      sha256 "29f222e1c4f41030c8d34ee747939464202b72da282386bdbc9ae1faa969cdcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.2.1/pls-linux-aarch64"
      sha256 "fd07efc029b05edf88ca8ab6e0f8340f437c12a517d84434b6961501f82e178a"
    else
      url "https://github.com/colus001/pls/releases/download/v0.2.1/pls-linux-x86_64"
      sha256 "e3623ce12089280bae98bacdd54212afc01ed9a2a577e10f96ca216d71086b3a"
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
