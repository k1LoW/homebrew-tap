class TailorLog < Formula
  desc 'tailor-log is a tool for handling logs from a workspace on the Tailor Platform.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/tailor-log'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.0/tailor-log_v0.6.0_darwin_arm64.zip'
      sha256 '07d1500ff5d7c7f24c94c4f5be6a2451a89c9112b3f366ba52ac9d2c3f59e3b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.0/tailor-log_v0.6.0_darwin_amd64.zip'
      sha256 '720039af6b54014a77be7bba0369ec85357020737518db82b148f0f0c5f81e86'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.0/tailor-log_v0.6.0_linux_arm64.tar.gz'
      sha256 'ff20dd96c29ccb5f4d0dcfd35702ffd342e97350c26fe9dca275df2af3ac7912'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.0/tailor-log_v0.6.0_linux_amd64.tar.gz'
      sha256 'b22f05ca77f9e814a1527043851e372bbea4080cac6f4acb82a0f002415a01f1'
    end
  end

  head do
    url 'https://github.com/k1LoW/tailor-log.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tailor-log'
  end
end
