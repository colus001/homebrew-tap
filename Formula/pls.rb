class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.3/pls-macos-aarch64"
      sha256 "cd5cb7c5171c6c5910ac80ba2cce550cebf449cbdf53a704c5d3665735a15e54"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.3/pls-macos-x86_64"
      sha256 "e37e806cce7bccda81e9f982fce847cdd99f6b17bb13f43d4acb04147ef404e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.3.3/pls-linux-aarch64"
      sha256 "a544467ab583fd31b67480ee9ef2ba4c650c94a8d945174fec3754104feebe90"
    else
      url "https://github.com/colus001/pls/releases/download/v0.3.3/pls-linux-x86_64"
      sha256 "063352b69b88295bb69daefa704838c803f8481e587ca6eae6fcc458e8b6a7df"
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
