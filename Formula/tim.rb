class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.0.12"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.0.12/tim-osx.tar.gz"
    sha256 "adffd5592574d46429171bc553565ab7ac69a9f87f4dc51f71e5fc723a3714fb"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end
    
    url "https://homebrewfiles.blob.core.windows.net/tim/0.0.12/tim-linux.tar.gz"
    sha256 "7d69e5a554793199db217a16b9ac807e4f4de3d331a9e63e5419566ff979602a"
  end

  def install
    bin.install "tim"
  end
end
