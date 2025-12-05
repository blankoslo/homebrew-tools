class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.2.4"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-osx.tar.gz"
    sha256 "fcd1ac3e41f7311dc65581df40029c111490068b455e3da21d6d7e31971fb5db"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-linux.tar.gz"
    sha256 "45cef902e4153ff6feec8a7329b60d53642d1b95cee0c50bdd486833530c7fcb"
  end

  def install
    bin.install "tim"
  end
  
  test do
    system "#{bin}/tim", "--version"
  end
end
