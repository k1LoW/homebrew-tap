class Gostyle < Formula
  version '0.6.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.6.0/gostyle_v0.6.0_darwin_arm64.zip'
      sha256 'db73afd949ca15a03eeed14baa14ede4253370536b6758c86384b4edfe904da3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.6.0/gostyle_v0.6.0_darwin_amd64.zip'
      sha256 '0063363e729ac899b81526d3bc05be849c96986baacdb2de1b67e72ab919995e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.6.0/gostyle_v0.6.0_linux_arm64.tar.gz'
      sha256 '9c2b8c2d19eb44ddf660ad0138714463dc53bcf6b21edc825014b58913a0258b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.6.0/gostyle_v0.6.0_linux_amd64.tar.gz'
      sha256 'b043a9cdb06f58f09fbec9b87675c934a79975f7a676c775c5ba93f219e2c2d1'
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
