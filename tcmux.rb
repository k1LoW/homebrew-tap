class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.2.3'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.3/tcmux_v0.2.3_darwin_arm64.zip'
      sha256 'e0041ffe1a9a30d564112ea48109a11e256195a269bd911073fdfd6cae0af27f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.3/tcmux_v0.2.3_darwin_amd64.zip'
      sha256 '41ec7cfac433739c0d74f4a214b2ff3c68196ac5ee6cf5bb3b96165797af3249'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.3/tcmux_v0.2.3_linux_arm64.tar.gz'
      sha256 '699427c5586851438a78e6c8cf28c5deb64c51039071b3491835e4d37aec3c32'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.3/tcmux_v0.2.3_linux_amd64.tar.gz'
      sha256 'be316400ac55ec1ff7c3dc4609855e856bee6432411bb6f0be0a8d442fee6f34'
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
