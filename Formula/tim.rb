class Tim < Formula
  desc "tim - floq cli"
  homepage "https://github.com/blankoslo/tim"
  version "0.2.2"

  if OS.mac?
    unless Hardware::CPU.arm?
      odie "tim is only available for macOS arm64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.2/tim-osx.tar.gz"
    sha256 "845f3b51be07f14c1ef8863be515853e591e6eb933d9f5181e3277e605424548"
  elsif OS.linux?
    unless Hardware::CPU.intel?
      odie "tim is only available for Linux x86_64 currently."
    end

    url "https://homebrewfiles.blob.core.windows.net/tim/0.2.2/tim-linux.tar.gz"
    sha256 "01cfe7316cbf87f2187f8ea1fd63ee06cc1967a3ddebff352ff27576721b5e25"
  end

  def install
    bin.install "tim"
  end
end
