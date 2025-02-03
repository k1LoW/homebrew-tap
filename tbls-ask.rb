class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.1/tbls-ask_v0.4.1_darwin_arm64.zip'
      sha256 'f64090c24d6dc1fa803eb2946345e4da28c70c77321e183b3e5cdcb60ddab00c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.1/tbls-ask_v0.4.1_darwin_amd64.zip'
      sha256 '0a927d33d9e9b535b50e8158927dae48708edd0ffd4231a7518db00b28f66f2e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.1/tbls-ask_v0.4.1_linux_arm64.tar.gz'
      sha256 'f603b80e6b618306ed71fcfa3bf3c694cbcc4b22c86e9f0eb4002da4365bb25d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.1/tbls-ask_v0.4.1_linux_amd64.tar.gz'
      sha256 '4208bca509d1af82546b2a4e0fe44eba7d36fb55349a621981b2277b2abde458'
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
