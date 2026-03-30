class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.0/pls-macos-aarch64"
      sha256 "52402a578d09243062a46b2f0a96ec517fa784c707baa61b3f643f37e0a2558e"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.0/pls-macos-x86_64"
      sha256 "30be8801b6a9f8524a7a1baf483dfbd3b83fe80c36521501e2f7f697df994276"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.0/pls-linux-aarch64"
      sha256 "f656c12dc40938a5ac6a607db554a15b38ae7e761f4ee020c2bb7add2886c322"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.0/pls-linux-x86_64"
      sha256 "68f1672e181995ad89feaad862ddfa598aacb405e2b237ed6eb360715182ec7e"
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
