class Gostyle < Formula
  version '0.25.2'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.2/gostyle_v0.25.2_darwin_arm64.zip'
      sha256 '5d39fd08c7960c1f334bbb7ae1c160deb07494cd81287ed9fa8890e8f83f16b1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.2/gostyle_v0.25.2_darwin_amd64.zip'
      sha256 '82a3ce6957c234646821387e9e141fd5683fd101ed17619960955ee0a2e9c1c0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.2/gostyle_v0.25.2_linux_arm64.tar.gz'
      sha256 '96e83be7d93b4d87f921e5be421d9107a010716c524d50bdb23f939af6d807a9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.2/gostyle_v0.25.2_linux_amd64.tar.gz'
      sha256 'a364011ee27111185f030f0b3e5830b3e292026c73d2b08ad0ecbdbae48ef0d0'
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
