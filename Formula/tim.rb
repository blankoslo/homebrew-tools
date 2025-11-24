class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.1.3"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.1.3/tim-osx.tar.gz"
    sha256 "d7d02f59255262f0f3f385f3914303d289f7a91fb5915c89ad083e712f7a91ad"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.1.3/tim-linux.tar.gz"
    sha256 "00d8ccb164f7a91713ba909baaf4492967ff5bd9b7ae491678e06af6fffc9867"
  end

  def install
    bin.install "tim"
  end
end
