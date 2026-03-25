class Pls < Formula
  desc "AI-powered CLI assistant"
  homepage "https://github.com/colus001/pls"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.2.0/pls-macos-aarch64"
      sha256 "16f2db3bc92eb7cafb084cdd615b0353c251531fc26bd9b08619db06d1ce6472"
    else
      url "https://github.com/colus001/pls/releases/download/v0.2.0/pls-macos-x86_64"
      sha256 "9c9fae6a7592ebd08f1bce84a55440e36e464a28d5ffa1871027e87cb68c2d7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colus001/pls/releases/download/v0.2.0/pls-linux-aarch64"
      sha256 "d70e40eb5e324863192e1e02352a8fab40b3599cba7a9ae2c143314263068977"
    else
      url "https://github.com/colus001/pls/releases/download/v0.2.0/pls-linux-x86_64"
      sha256 "9b083a144be1f689a43e13d6319cca187f66555326b507f57a9ddbc42fe14cdf"
    end
  end

  def install
    bin.install Dir["pls-*"].first => "pls"
  end

  test do
    assert_match "pls v#{version}", shell_output("#{bin}/pls --version")
  end
end
