class Runblock < Formula
  desc '`runblock` is a tool for executing code blocks in Markdown files using external commands.'
  version '0.1.2'
  homepage 'https://github.com/k1LoW/runblock'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.2/runblock_v0.1.2_darwin_arm64.zip'
      sha256 'c1dbbee1d15b2c68e24ee5b7f8a1c9807b3cbe957cef592ce779ab25f596f47c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.2/runblock_v0.1.2_darwin_amd64.zip'
      sha256 'cbafd5217dfeadad01360063e0f56be9ee786de822e11c2afa7aca6cf2763cbb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.2/runblock_v0.1.2_linux_arm64.tar.gz'
      sha256 'df7f73a496e022b9cfd38aa7aae162a29d9d4fce7fbb8af9ea2895be652fcbbe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.2/runblock_v0.1.2_linux_amd64.tar.gz'
      sha256 '9cee63555d7aeb034ad671bac9ff4b25c336ef99852b5f1b13c32b70c9f6261c'
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
