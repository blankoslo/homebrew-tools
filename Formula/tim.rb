class Tim < Formula
  desc "tim - timeføring cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.1.0"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://github.com/blankoslo/tim/releases/download/0.1.0/tim-macos.tar.gz"
    sha256 "01cabc62beb1c07087e8060a3fb705efe0f24b80e7a6675614289bc8ff11a320"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end
    
    url "https://github.com/blankoslo/tim/releases/download/0.1.0/tim-linux.tar.gz"
    sha256 "8c05b1a7b4530e50f1e73fb1a017dde95ae2fcc36e6daa386bed8161dcb0f8f3"
  end

  def install
    bin.install "tim"
  end
end
