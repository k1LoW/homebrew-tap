class Roots < Formula
  version '0.4.1'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.1/roots_v0.4.1_darwin_arm64.zip'
      sha256 '7d658c375cbc331d075b18fcab15cf24147046b9c88d5587886f6e2e545b8b2a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.1/roots_v0.4.1_darwin_amd64.zip'
      sha256 'e0970b111e2872d237e8b95bf600a2f8ec3965047499c0e228e0d18d4c32185d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.1/roots_v0.4.1_linux_arm64.tar.gz'
      sha256 'b5ec1d449cf33066dfccd280ddb4d7748f1ad655974620db1c96841a60ec9f1e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.1/roots_v0.4.1_linux_amd64.tar.gz'
      sha256 'f67112927422b18e72ba5827a5e42e6e4ca771127ef65bf89daa6b03ae23de55'
    end
  end

  head do
    url 'https://github.com/k1LoW/roots.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'roots'
  end
end
