class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.2'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.2/tbls-ask_v0.6.2_darwin_arm64.zip'
      sha256 '2793edfea46409102ea08607a381364c21d4d8ac86c5879a3f56fcf16674ffec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.2/tbls-ask_v0.6.2_darwin_amd64.zip'
      sha256 'c4c7c286e9ef494c0f7d3c8eb2c2f628567577683dc20883f72244cd2f8c588f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.2/tbls-ask_v0.6.2_linux_arm64.tar.gz'
      sha256 '9c8dd5454a9cedaba323bacc1cfacd42ab48c041af6511f81d880d1447c61c60'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.2/tbls-ask_v0.6.2_linux_amd64.tar.gz'
      sha256 'bc975b48b997f5cc45047c05e818b5f315f3fab26de4839f539d1dc944b72367'
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
