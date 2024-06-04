class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.0.6'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.6/tbls-ask_v0.0.6_darwin_arm64.zip'
      sha256 '249ee9b3afaed72b1263fcab6e2036cb34a1a186222d7695f8d9c0431b774a2f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.6/tbls-ask_v0.0.6_darwin_amd64.zip'
      sha256 '5ed591857cff554eb7e76112bc77ac8e217d0afb0856d607ee3bff52d24521e4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.6/tbls-ask_v0.0.6_linux_arm64.tar.gz'
      sha256 '9e00af3247f5b711a99faac52b115de768f699a28f3addde143d324656baa8cc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.6/tbls-ask_v0.0.6_linux_amd64.tar.gz'
      sha256 'f95142de652f0235b148d0407d9da187a3f3564908c2c231a1759408c426ae1a'
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
