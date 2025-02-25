class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.2.1'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.1/cuestr_v0.2.1_darwin_arm64.zip'
      sha256 '0ca01996ff5e72a0c62d924076a2c6978d3f801b9bae3d5d6f43c1d19eaef644'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.1/cuestr_v0.2.1_darwin_amd64.zip'
      sha256 'd4b7c99472349302be22604914edf143d9731681dae755420970958f1e490b06'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.1/cuestr_v0.2.1_linux_arm64.tar.gz'
      sha256 'e5e29bcb405033b86505222d51b7c70d6e79e233d1733899f136467b89ebbca8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.2.1/cuestr_v0.2.1_linux_amd64.tar.gz'
      sha256 '0c022d2993526a2994337e95dfcdc0e3d8ae61afaf5a01e3110085217ff1d72a'
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
