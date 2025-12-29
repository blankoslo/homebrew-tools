class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.5.0"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-osx.tar.gz"
    sha256 "3c1dc73fda8848c476cb2e729ebbd4a9b1e7e751ea306d40225dda6328d1e4e2"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-linux.tar.gz"
    sha256 "3589b5d35ac6c2845fc4d1bd2bf11fe3e7afaade5cf2883e82a43bc0b794f7e0"
  end

  def install
    bin.install "tim"
  end
  
  test do
    system "#{bin}/tim", "--version"
  end
end
