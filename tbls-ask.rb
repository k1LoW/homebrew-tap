class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.7.0'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.0/tbls-ask_v0.7.0_darwin_arm64.zip'
      sha256 '68efed9e51294e3853247f868121be3c214cb356a8af82a304128172a984eb2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.0/tbls-ask_v0.7.0_darwin_amd64.zip'
      sha256 '1904abad6399449dbc44b0987e739052af06e82023e4747ec1f0ba0ac7a05cf3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.0/tbls-ask_v0.7.0_linux_arm64.tar.gz'
      sha256 '122555909d4d609f842aea1219b6b432b436505001aa7374d17d36367d90f7f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.0/tbls-ask_v0.7.0_linux_amd64.tar.gz'
      sha256 '4edba8670ef8b8b232f8a95c3f1321e8c11884797f40c0302ab980676e518e58'
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
