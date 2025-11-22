class Tim < Formula
  desc "tim - timeføring cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.0.11"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.0.11/tim-osx.tar.gz"
    sha256 "3303c7b9e68a5b4bfa8379304a17cca8f2c7accbca6b67d196732264c89128ea"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end
    
    url "https://homebrewfiles.blob.core.windows.net/tim/0.0.11/tim-linux.tar.gz"
    sha256 "5793ee21eb2ba2e05886f216c73e14d9102224e69336a500418b67e668c92052"
  end

  def install
    bin.install "tim"
  end
end
