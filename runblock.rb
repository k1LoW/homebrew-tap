class Runblock < Formula
  desc '`runblock` is a tool for executing code blocks in Markdown files using external commands.'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/runblock'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.1/runblock_v0.1.1_darwin_arm64.zip'
      sha256 'f9ae8222cac6c6528ccd1e3cf45228fea147b10813bdd817b80dc502f6f39ec1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.1/runblock_v0.1.1_darwin_amd64.zip'
      sha256 '0aee0742a8e2415fa0274bb6c90c58c2ab15026e02d9b5417496a0810e996222'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.1/runblock_v0.1.1_linux_arm64.tar.gz'
      sha256 '7bc43ef5c07afd87bef8ae4b11b423742bee7c4bda302e15b4f849c046d98634'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.1/runblock_v0.1.1_linux_amd64.tar.gz'
      sha256 '5dd601822681e5b41ca62bf3636c14d913b35f14b4d69d425b69d227480a5571'
    end
  end

  head do
    url 'https://github.com/k1LoW/runblock.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'runblock'
  end
end
