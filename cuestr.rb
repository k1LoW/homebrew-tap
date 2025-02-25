class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.0.1'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.0.1/cuestr_v0.0.1_darwin_arm64.zip'
      sha256 '51cdcdbcea777f1afe29ba9207effc151a271440634479f966763d469a4daa3c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.0.1/cuestr_v0.0.1_darwin_amd64.zip'
      sha256 'ffcb84c78862ec0799f510615d8324a90c7b38779e44a00d798acd61adf7ac32'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.0.1/cuestr_v0.0.1_linux_arm64.tar.gz'
      sha256 '6eda5c9f0572b1ce2ec3ce7366b003d3dc15b89a1c1dda2c949529db2cf1752a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.0.1/cuestr_v0.0.1_linux_amd64.tar.gz'
      sha256 '89894578905b6ab9b709dc25e9a8c68699c9580257bb1fb40c390b388c7a3fb9'
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
