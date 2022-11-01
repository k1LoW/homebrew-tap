class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.45.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.45.1/runn_v0.45.1_darwin_arm64.zip'
      sha256 'db45baa27f1acbc10f8b103d8481472c48fb2a1945efdcfd3d3c43c0d447d165'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.45.1/runn_v0.45.1_darwin_amd64.zip'
      sha256 '66ae1bdc42d19c0b4e686bd226ca69132aec8f7bd937f2c40656efa638f86e4c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.45.1/runn_v0.45.1_linux_amd64.tar.gz'
      sha256 'd7e484080b6348af7dbbd953672ce9e83b8c7f442deabef8676d1649e56d2b67'
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
