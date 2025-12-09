class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.3.1"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-osx.tar.gz"
    sha256 "0cfcd0fe5c5af0be4c9ad37236872cc55a45f0179bec960ecf61f3b2d5201e42"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-linux.tar.gz"
    sha256 "fcc67629b9b94e1b6470c1ad917d674f5793bbcda7a5e550f3228afb5310eead"
  end

  def install
    bin.install "tim"
  end
  
  test do
    system "#{bin}/tim", "--version"
  end
end
