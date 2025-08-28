class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.3'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.3/tbls-ask_v0.6.3_darwin_arm64.zip'
      sha256 '0a689a0195358d9f45649b7f1aa2ee1b3778f1da8c936f18ebe10f5cb534655c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.3/tbls-ask_v0.6.3_darwin_amd64.zip'
      sha256 '4940fac2ac6c082e0990e7c4324cbdc8faf53ef24200f6348590f4590d77805d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.3/tbls-ask_v0.6.3_linux_arm64.tar.gz'
      sha256 'efd33323b0dd88156ddc75c4a30b61197a61a72d75c3665655ef76c12e62e8d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.3/tbls-ask_v0.6.3_linux_amd64.tar.gz'
      sha256 'ce5f76d1b8b21808929c25093fa84644e704e4cb75c1bcb9be27f6fd930799fa'
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
