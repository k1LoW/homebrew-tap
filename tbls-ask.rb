class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.0/tbls-ask_v0.6.0_darwin_arm64.zip'
      sha256 '8c43dc3ecc172dc3294db67be3a098858eaad8587e47e6cf1716b73f4545c74f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.0/tbls-ask_v0.6.0_darwin_amd64.zip'
      sha256 '6d13533a45a254cbb2f67d012770f8bd8c4dc82500fd93403a48ed2a40955429'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.0/tbls-ask_v0.6.0_linux_arm64.tar.gz'
      sha256 '4bc0cf2d958f9650a2c89ffe4cdf1d177b3fdbe185cf3fe3e4014d54cd309bd0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.0/tbls-ask_v0.6.0_linux_amd64.tar.gz'
      sha256 'd03d46041e744f17e5353517dbfc99c95eb756f1352d00028d7cad5f961f8dda'
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
