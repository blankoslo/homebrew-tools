class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.2.1"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.1/tim-osx.tar.gz"
    sha256 "d5b22de14e3ac77e3516a8218984373c838e4e7b909b68161c46268029e1748e"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.1/tim-linux.tar.gz"
    sha256 "0a01c597d9bc00a0880e24312f9e7bb91dd7ab699e134758d4b911e12df51aa1"
  end

  def install
    bin.install "tim"
  end
end
