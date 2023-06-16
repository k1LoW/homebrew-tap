class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.10.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.10.0/octoslack_v0.10.0_darwin_arm64.zip'
      sha256 '0769196e33aac097721faf68cb50d69540979a26a50bbe18b1b980cdb969b032'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.10.0/octoslack_v0.10.0_darwin_amd64.zip'
      sha256 'a10c9f7a1021d00a19f7aabfb2008c888867f0c8fef7f5106286120065219fc1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.10.0/octoslack_v0.10.0_linux_amd64.tar.gz'
      sha256 'a2a4fb956af180229bbcdcc372c7a75c73735310d97a3cbf4b35abe55ddbc10d'
    end
  end

  head do
    url 'https://github.com/k1LoW/octoslack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octoslack'
  end
end
