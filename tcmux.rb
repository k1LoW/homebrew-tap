class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.2.2'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.2/tcmux_v0.2.2_darwin_arm64.zip'
      sha256 '47aa25e40644fbdb6cafa2a50a4eb1eb011dde272e3bc28b0d1f063a2fc63f14'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.2/tcmux_v0.2.2_darwin_amd64.zip'
      sha256 '5ccb287108af18d23399f287d58af33abf3a10da2b6997f4bd2301ac649c2184'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.2/tcmux_v0.2.2_linux_arm64.tar.gz'
      sha256 '74238481f16be705667477f9851705e5bc755a1de502fb41a5a57fe0362f2f3c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.2/tcmux_v0.2.2_linux_amd64.tar.gz'
      sha256 '6986b79fdca58d6298999ddec033fc115573ca4c83465a1a605806d688a4012a'
    end
  end

  head do
    url 'https://github.com/k1LoW/tcmux.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tcmux'
  end
end
