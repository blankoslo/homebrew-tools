class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.3.0"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-osx.tar.gz"
    sha256 "4ff33e357e9e9cee2bbd4260b6f96ecd88821a52b33310fa752dac2985891771"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-linux.tar.gz"
    sha256 "afe7cc7df9db15d5354041feb3d1299da1410f23002813f5e629b98d8702a914"
  end

  def install
    bin.install "tim"
  end
  
  test do
    system "#{bin}/tim", "--version"
  end
end
