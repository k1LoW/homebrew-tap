class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.5'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.5/tbls-ask_v0.6.5_darwin_arm64.zip'
      sha256 '52b0809b1e67268a374132a40234c803a27bfdb600bde3ac5387090df1be9c9c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.5/tbls-ask_v0.6.5_darwin_amd64.zip'
      sha256 '4065898810da0f7903a1ac2023240a5303011d692d395c010d6fbab0f38b05e2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.5/tbls-ask_v0.6.5_linux_arm64.tar.gz'
      sha256 '8b9243c1af48484c8985dbe8a08337307d6e8fafc0550192d30340e545a6b2cc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.5/tbls-ask_v0.6.5_linux_amd64.tar.gz'
      sha256 'fe8ee3e1df900dc2345b88eb8aa244970f74d530052e01123ed9e6e953cbd984'
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
