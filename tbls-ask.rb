class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.0/tbls-ask_v0.3.0_darwin_arm64.zip'
      sha256 '0a09c7cc266f119ed98183efeba912887de35fbf4cdd8f2b68df86e17dbcd7c0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.0/tbls-ask_v0.3.0_darwin_amd64.zip'
      sha256 '72822afc47173222dc4be40fc38186bfe1b87353de0e41dacbe8d0f076fcc554'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.0/tbls-ask_v0.3.0_linux_arm64.tar.gz'
      sha256 '67d06da2bbc01b782a12b898f35b8d46396d8da1d2f206179c16065098e9b00e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.0/tbls-ask_v0.3.0_linux_amd64.tar.gz'
      sha256 '6812493aa6eea413ca79f441995a31db0c494769c6648c36801dabd4849c11c7'
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
