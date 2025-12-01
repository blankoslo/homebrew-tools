class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.2.3"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.3/tim-osx.tar.gz"
    sha256 "d453963d52ba93372a0b62aac416120865b1e277f98dc9532b3527aa77594c46"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.3/tim-linux.tar.gz"
    sha256 "afc8fbc81af4c2d78f76a440f12b01bfe69697c5a349927298fc56ca0257926d"
  end

  def install
    bin.install "tim"
  end
end
