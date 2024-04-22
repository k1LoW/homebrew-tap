class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.2.0/tmpmod_v0.2.0_darwin_arm64.zip'
      sha256 '28cb37a743b7c55eae7106486fc480c7b2d3ab30d78fab0d5fd08c2cd89fc25d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.2.0/tmpmod_v0.2.0_darwin_amd64.zip'
      sha256 'f523d5fde6d5675903ede3762728957f0ed0961ccf1a7029934682e3e3d97740'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.2.0/tmpmod_v0.2.0_linux_arm64.tar.gz'
      sha256 '3c4ca2a4323e4a08b4e92b1767c444ed87804b08fb104a0d9c4e92bbb54033f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.2.0/tmpmod_v0.2.0_linux_amd64.tar.gz'
      sha256 '46549879f05ab4949a010dee96da6b6aab936f72f35ff351e65e61c579782c3f'
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
