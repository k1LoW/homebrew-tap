class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.89.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.89.0/runn_v0.89.0_darwin_arm64.zip'
      sha256 'e176354b08704777b8f367bbbd7d2b445aab0a691f3c7cf03c45a46e78fbea39'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.89.0/runn_v0.89.0_darwin_amd64.zip'
      sha256 '9cf344f613154492277e00048debae38afdfafebfc11adb37f552e57858c1bba'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.89.0/runn_v0.89.0_linux_amd64.tar.gz'
      sha256 '16f76b30c9f02ea9f3a71cf4b16f655b3077c555994ac81856f459a719b71d2d'
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
