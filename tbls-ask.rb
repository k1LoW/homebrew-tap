class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.1.0/tbls-ask_v0.1.0_darwin_arm64.zip'
      sha256 '28c8d0ed97d3663463d0c576eb771dd1005b9e560fa0fd622498377e336ab0fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.1.0/tbls-ask_v0.1.0_darwin_amd64.zip'
      sha256 'de4f7f7cd0b8dff3e63b738b0482f5889b1f8b42dd3ccd3cba385dd23c7dd090'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.1.0/tbls-ask_v0.1.0_linux_arm64.tar.gz'
      sha256 '2724f847d5657f4b5a66cf1d2943c86317d706284ccb98a4f77e3400a94335f6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.1.0/tbls-ask_v0.1.0_linux_amd64.tar.gz'
      sha256 '92ded6afa13a9fc1695324a8bb2ceac155dac34f0de6078de4b81488f467a9a2'
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
