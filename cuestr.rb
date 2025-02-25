class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.0/cuestr_v0.2.0_darwin_arm64.zip'
      sha256 '96bc3b3972582a390b964e81c2e0e63d429e1369bf3102b3ecb97af5bc551bf5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.0/cuestr_v0.2.0_darwin_amd64.zip'
      sha256 'e04912ff08cc41b85a1560bb1a1857e1291b960aadb6a3ecca92eb7c5ca97f41'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.0/cuestr_v0.2.0_linux_arm64.tar.gz'
      sha256 '2fc28c220a1ee5b73711d4ed2b91e1c2bbe2fe126e2ba86c6afcfaa3b10eff40'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.0/cuestr_v0.2.0_linux_amd64.tar.gz'
      sha256 '96650ee880c97d9c8893918074e9a6d9a6316876ab261cd5df71c83015b7cf5b'
    end
  end

  head do
    url 'https://github.com/k1LoW/cuestr.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cuestr'
  end
end
