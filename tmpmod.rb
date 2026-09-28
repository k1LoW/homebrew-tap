class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.8'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.8/tmpmod_v0.4.8_darwin_arm64.zip'
      sha256 'f05d5a99ba496240d7b3a0472eef8f4740d9b5afff4560806ea7f1eaccd6e88e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.8/tmpmod_v0.4.8_darwin_amd64.zip'
      sha256 '76189edcebe34e499482bca4c74bb59bacae4bd996e87de74339fbe78724af42'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.8/tmpmod_v0.4.8_linux_arm64.tar.gz'
      sha256 '2c6399c419fe7c7407ac5b28b18678eacc4a26f47797ab64e16aa999d1a2178c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.8/tmpmod_v0.4.8_linux_amd64.tar.gz'
      sha256 '51416210ff531ed69d8769821d8854879c08498381c56509bc7db329a27bf5a7'
    end
  end

  head do
    url 'https://github.com/k1LoW/tmpmod.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tmpmod'
  end
end
