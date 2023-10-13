class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.85.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.85.1/runn_v0.85.1_darwin_arm64.zip'
      sha256 '021123b472b77728db6b0d4c852cf7c14dcca83564d2ffe1843e6f6df89b640f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.85.1/runn_v0.85.1_darwin_amd64.zip'
      sha256 'b41793ca8d0f46885189c739f7921afde86a37164eed9bf48606982d660ebd02'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.85.1/runn_v0.85.1_linux_amd64.tar.gz'
      sha256 '17e3cf4b386ceb3263a23edd5fb95307a3d4bdfda069a2e0c75ddcdcaa9d9873'
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
