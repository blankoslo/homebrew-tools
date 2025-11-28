class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.2.0"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.0/tim-osx.tar.gz"
    sha256 "d80ca5017ef13a62b2b7d933010952f66de3419fff7499163ad9b74c4830fdb6"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.0/tim-linux.tar.gz"
    sha256 "93739f655475631656bbbb7cf995c76a3d3764f321770a7133ee2c555485c133"
  end

  def install
    bin.install "tim"
  end
end
