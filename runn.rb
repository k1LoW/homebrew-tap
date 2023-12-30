class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.92.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.92.0/runn_v0.92.0_darwin_arm64.zip'
      sha256 'f6929b4eed01aeca827896ccf774e39884ea383d1d19bf5a6564772912d08328'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.92.0/runn_v0.92.0_darwin_amd64.zip'
      sha256 '2287cdbd4a4b51c3a68187ffe1ef99dca7337aa36391482a83a342058e21426e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.92.0/runn_v0.92.0_linux_amd64.tar.gz'
      sha256 'e5531f8b1d68a52ff139ba0c25d00c5307b1601f79583fd5d5bc46dbd1cf18fc'
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
