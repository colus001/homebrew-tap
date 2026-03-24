class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.1.0/pls-macos-aarch64"
      sha256 "d4acbb9bb8ad38abad713852656ee042479012121dd993809a705fb243179868"
    else
      url "https://github.com/colus001/pls/releases/download/v0.1.0/pls-macos-x86_64"
      sha256 "6f00eefc4e77764063ee63564799c0bf10293920b048c69063e9a09ec804939f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.1.0/pls-linux-aarch64"
      sha256 "6d5e50bb31b66830c959f29fd6b3a0ff37fabc22c059f4758bcb0d6d54827487"
    else
      url "https://github.com/colus001/pls/releases/download/v0.1.0/pls-linux-x86_64"
      sha256 "de8467f6b677af61bac096fc6b10e535a457bbb2983d9a2b54e99a698942ff47"
    end
  end

  def install
    bin.install Dir["pls-*"].first => "pls"
  end

  test do
    assert_match "pls v#{version}", shell_output("#{bin}/pls --version")
  end
end
