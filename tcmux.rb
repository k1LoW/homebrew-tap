class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.4.0/tcmux_v0.4.0_darwin_arm64.zip'
      sha256 'd386ed5d1c5fed173ed224b6ea2ce86ffa8029a810cf67a9797d017c0e1745e5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.4.0/tcmux_v0.4.0_darwin_amd64.zip'
      sha256 'e04df7999d47d3f8056157f0235c7ac7521d24a3cb3a29412dd54f80b7256251'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.4.0/tcmux_v0.4.0_linux_arm64.tar.gz'
      sha256 '14f3aea409a445cc6a11a7900d17a59f6f7b0f39f7c1402b73fa50536167a754'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.4.0/tcmux_v0.4.0_linux_amd64.tar.gz'
      sha256 '9870f9939818c503b1d679eb6731fe113544ed0164f5328f7f57883a1f1dcbb4'
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
