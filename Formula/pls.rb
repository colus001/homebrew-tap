class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.1.1/pls-macos-aarch64"
      sha256 "d78875c92de007db29228561ba69956f895df59e69da0ed268a7c2d8180083d7"
    else
      url "https://github.com/colus001/pls/releases/download/v0.1.1/pls-macos-x86_64"
      sha256 "c40cc512bde1c8cd4c752b269755592d4e7a22afe76dae9aec33988847782d5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.1.1/pls-linux-aarch64"
      sha256 "514373ccaf441055a6f5b5d8b51ab4578528a18ce64fbb4707464f4b5d94d42a"
    else
      url "https://github.com/colus001/pls/releases/download/v0.1.1/pls-linux-x86_64"
      sha256 "9d4c17b9ec7b6a5b727002c0a869a6e8cd445e3488048021de0e156a9f10d294"
    end
  end

  def install
    bin.install Dir["pls-*"].first => "pls"
  end

  test do
    assert_match "pls v#{version}", shell_output("#{bin}/pls --version")
  end
end
