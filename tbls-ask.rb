class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.8'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.8/tbls-ask_v0.6.8_darwin_arm64.zip'
      sha256 '7578e000a241bbfbaaf22e188e6cfed649f160d756732d482e91498363baec71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.8/tbls-ask_v0.6.8_darwin_amd64.zip'
      sha256 '721cd19b0fcc4f0ad4325ab295fa728854cccfcbc31f5b51c7b66bab47ac05aa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.8/tbls-ask_v0.6.8_linux_arm64.tar.gz'
      sha256 'e0665a7b2e10781de15a606c9092fd13170b45f9cbb8bb4d77b241d2eed73b77'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.8/tbls-ask_v0.6.8_linux_amd64.tar.gz'
      sha256 '960164a201cca42097d7be76581c38a1a4a5ebf90604049d0be4129bb718cd65'
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
