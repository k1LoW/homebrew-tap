class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.6'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.6/tbls-ask_v0.6.6_darwin_arm64.zip'
      sha256 '8f52f4ec6ed890d1375be3dc39d58c4cb25f7449f843c8a32c73a4ee3ba054e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.6/tbls-ask_v0.6.6_darwin_amd64.zip'
      sha256 'f970c5366879c2d36729f2c7223586cc1bea913dafb191a7961e1b8a0d4b31da'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.6/tbls-ask_v0.6.6_linux_arm64.tar.gz'
      sha256 '77649cef9a5848784bccd987a71a8ffc007a5a5355f862faf90acf53fafc0f2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.6/tbls-ask_v0.6.6_linux_amd64.tar.gz'
      sha256 '356e5efa7b336292e1785b4a8383b409a29d252c6dc1d3ab80d6dd2c3aea29e3'
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
