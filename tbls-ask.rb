class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.10'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.10/tbls-ask_v0.6.10_darwin_arm64.zip'
      sha256 'd817a6f90c4564b0ec873278a5929463b1867c807a2ffd4eeb1070e8e16deccd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.10/tbls-ask_v0.6.10_darwin_amd64.zip'
      sha256 '2254c6dc2cab5390c4a77218fc5538a5ca8fa560682179356f28259861b595fe'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.10/tbls-ask_v0.6.10_linux_arm64.tar.gz'
      sha256 'd3db2a8b2d81e842cb4402bceab3daaf0f0bd4f5658761fa5686f9c098b4a65f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.10/tbls-ask_v0.6.10_linux_amd64.tar.gz'
      sha256 'eea14b234e2797e355d914a9e41af02d1fa6fee9846a62a3d7bfbe76c4e48645'
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
