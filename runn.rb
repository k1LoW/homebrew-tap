class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.132.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.2/runn_v0.132.2_darwin_arm64.zip'
      sha256 '8475b08a0227049023cb5d2a3612aa2f145d57053239d777aae00f42a4eff43b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.2/runn_v0.132.2_darwin_amd64.zip'
      sha256 '54e7c641407b38b3a395a811c86d3ed6a3e74996ef1f001e98fd18374c2240c7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.2/runn_v0.132.2_linux_amd64.tar.gz'
      sha256 '2834e39b452bf0b58599704d57308ff4ed48af15869d95fcc687afb3ca9948cb'
    end
  end

  head do
    url 'https://github.com/k1LoW/runn.git'
    depends_on 'go' => :build
  end

  def install
    system 'make', 'build' if build.head?
    bin.install 'runn'
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
    (bash_completion/'runn').write output
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
    (zsh_completion/'_runn').write output
  end
end
