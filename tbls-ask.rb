class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.5.0/tbls-ask_v0.5.0_darwin_arm64.zip'
      sha256 '20316ab72986170a42663728b2685c42d187cc4658f732344c30e68ebfb92c9a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.5.0/tbls-ask_v0.5.0_darwin_amd64.zip'
      sha256 '94a91293a5f4fa83cc0caa126779eb666694ed96d36716a0261072edcccd0fd3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.5.0/tbls-ask_v0.5.0_linux_arm64.tar.gz'
      sha256 '5073c7138d5ba0e22e1dbbd68828c97e98ff70c0c19973c7b4d812525acb9866'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.5.0/tbls-ask_v0.5.0_linux_amd64.tar.gz'
      sha256 'e51eb072fdcad0769145975943916587a75b511ce016fab94f1d5f1036e6e19c'
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
