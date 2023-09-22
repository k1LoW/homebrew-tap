class Gostyle < Formula
  version '0.16.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.16.0/gostyle_v0.16.0_darwin_arm64.zip'
      sha256 'a1a68b05671c67ccb2fe890ab3b4d691ec4291f6d95668be863f635cd315ffea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.16.0/gostyle_v0.16.0_darwin_amd64.zip'
      sha256 'e33f75f5074889733146f5d7df41d36fa57aba9f09d4163c43e482ee5f5dec6c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.16.0/gostyle_v0.16.0_linux_arm64.tar.gz'
      sha256 'b64dd8e19a474a80b8b88f6eb66b70a9de68854e146e30bd8bede1b4810d196a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.16.0/gostyle_v0.16.0_linux_amd64.tar.gz'
      sha256 '929cc6a649082cbb1e823fcae2b2740fef30c4a47dc59572b78223346138c66b'
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
