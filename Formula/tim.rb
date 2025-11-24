class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.1.0"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.1.0/tim-osx.tar.gz"
    sha256 "f07d75785997d921a0d5260a41f49069039af71255c2bfc0e2966c0419807aff"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end
    
    url "https://homebrewfiles.blob.core.windows.net/tim/0.1.0/tim-linux.tar.gz"
    sha256 "d3ce109c07f3ec19981f4c58b5224088c6574cffaf28bd6c6b5d37633e785e06"
  end

  def install
    bin.install "tim"
  end
end
