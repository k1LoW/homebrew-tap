class Gostyle < Formula
  version '0.18.1'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.1/gostyle_v0.18.1_darwin_arm64.zip'
      sha256 '777943ce2524be627a9bfb43a0edcb35e8bb1f62532b905c0991f57ca438c66e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.1/gostyle_v0.18.1_darwin_amd64.zip'
      sha256 '2c4e5f4bfdeeb81b214a8d28d421511ddadaa12b3752c2cdd3f76d71c4035f2c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.1/gostyle_v0.18.1_linux_arm64.tar.gz'
      sha256 '586939e9e239c38cd28a8c69061aea5344168f884b6ce7faaffb0c954dcad716'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.1/gostyle_v0.18.1_linux_amd64.tar.gz'
      sha256 'f828b8af694049a2be783b47e359ccf4e4f94f6b81aadefcc4bf376ee7f17fc3'
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
