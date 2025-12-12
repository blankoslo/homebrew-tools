class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.4.0"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-osx.tar.gz"
    sha256 "4fb59041242fd025be2fcb43cac08bd2a0660691b4129d8515e181ab1ae43dc7"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/#{version}/tim-linux.tar.gz"
    sha256 "8eddf4132bed734ac52d25a9c233501bd7b3715744aad99bcf07f5a7b30cba83"
  end

  def install
    bin.install "tim"
  end
  
  test do
    system "#{bin}/tim", "--version"
  end
end
