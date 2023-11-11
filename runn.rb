class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.90.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.0/runn_v0.90.0_darwin_arm64.zip'
      sha256 'd7a40f37f0b152af64e871cd3a19903f9a02720e931c471f53c4400810ddad7a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.0/runn_v0.90.0_darwin_amd64.zip'
      sha256 'd6af6ff6b44234038b11e46741ffe320f4da0ce491583e46351c61b55365ccb3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.0/runn_v0.90.0_linux_amd64.tar.gz'
      sha256 '772397790b3d3081dff589cb85b9c632f5446b0dc6dc9439d2a55a6cb8b0f924'
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
