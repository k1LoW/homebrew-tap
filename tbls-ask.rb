class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.1'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.1/tbls-ask_v0.6.1_darwin_arm64.zip'
      sha256 '2c2d192d406618bceeb4338ac3fc8564655a7ff6687d87db4ed8a9713ea56798'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.1/tbls-ask_v0.6.1_darwin_amd64.zip'
      sha256 '96ce3abe7e48eee7b953f07a976b782ebe282b3f410a81643b03c51694a0792a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.1/tbls-ask_v0.6.1_linux_arm64.tar.gz'
      sha256 '3ed47a535eaf4aaf3c0bfe6bad88aa9598948e4cfe2d6b44d32cfd9dd2106729'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.1/tbls-ask_v0.6.1_linux_amd64.tar.gz'
      sha256 '4982872ecb8131f7c20c6b4ebe65b31367b4ae79106160d544c85535947d3b45'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-ask.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-ask'
  end
end
