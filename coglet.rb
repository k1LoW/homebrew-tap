class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.0.2'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.2/coglet_v0.0.2_darwin_arm64.zip'
      sha256 'e6881d6566b8ac696d287abc5d0ed8877e3582bbbab3e9e3e3dbf6f7a50adbe8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.2/coglet_v0.0.2_darwin_amd64.zip'
      sha256 '839654214a80245f94eec5fac19160ac3063e36c18d8b2f7ede09a6548ac4f73'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.2/coglet_v0.0.2_linux_arm64.tar.gz'
      sha256 'b16ce2f6032f50673c97d72a98fdb72d8a3611dcaa7fa5348c413f24f211d563'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.2/coglet_v0.0.2_linux_amd64.tar.gz'
      sha256 '6bfe95d89bc84b0753ee7fd64ea454459d34ce116312e4b87493644d1c51cda3'
    end
  end

  head do
    url 'https://github.com/k1LoW/coglet.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'coglet'
  end
end
