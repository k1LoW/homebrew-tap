class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.0.2'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.2/tbls-ask_v0.0.2_darwin_arm64.zip'
      sha256 'a0449c90a581ddcef83348f7242492c2e268ec1160b424e1ad597873397a889e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.2/tbls-ask_v0.0.2_darwin_amd64.zip'
      sha256 '71113fbae39170208f56807d71724fb0390abe53beae5806d510ba7803558cf2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.2/tbls-ask_v0.0.2_linux_arm64.tar.gz'
      sha256 '50d8369e7e7f8e3f8851402f37412bd17a602a0cfd51f8e2801518c8fcdfd100'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.2/tbls-ask_v0.0.2_linux_amd64.tar.gz'
      sha256 'e2e70f0455b1302ebfa4d099d7b8f339f575d1292cef9c5118a8680615289e3f'
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
