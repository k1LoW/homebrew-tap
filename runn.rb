class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.68.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.68.0/runn_v0.68.0_darwin_arm64.zip'
      sha256 'e6732c1783a8e3c2a7a4c27f73f980ae748199d0420543da45bcf6e18a4d9d51'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.68.0/runn_v0.68.0_darwin_amd64.zip'
      sha256 '7a65f3310cbea5cd35bb7bf159b4ca9bb7cc363c73e8ed4403761bbb24b94d8e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.68.0/runn_v0.68.0_linux_amd64.tar.gz'
      sha256 '378a804e6482224ddc8fca72b93f04342af3e6fda7329c2ec556f0d2dfe41862'
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
