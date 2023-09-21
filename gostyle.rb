class Gostyle < Formula
  version '0.15.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.15.0/gostyle_v0.15.0_darwin_arm64.zip'
      sha256 '8b29b9df634cab25a36039ce5b924ea2ba1447ee72803ec5ef95f7033ecb86fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.15.0/gostyle_v0.15.0_darwin_amd64.zip'
      sha256 '890032b3260b9f2880066f8f4bcddbb57fbb24604d7b03215e80c0a934fd872d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.15.0/gostyle_v0.15.0_linux_arm64.tar.gz'
      sha256 '143ecac382757b677851ecd40a1ee23316dd20d67d96c377f971a15295b0932a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.15.0/gostyle_v0.15.0_linux_amd64.tar.gz'
      sha256 '44eef58d748c6203537a33f9063d16a09299b0ac7ebde5677e67385cf10b4d65'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
