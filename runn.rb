class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.114.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.114.1/runn_v0.114.1_darwin_arm64.zip'
      sha256 '5ef34c12c7ee777a02338a14c32ad0b12ce509e6a22eded6fdfcba9ed1fdda91'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.114.1/runn_v0.114.1_darwin_amd64.zip'
      sha256 '21ba330d3d4494ecb31eda52cd9b2f5f12ac2f855fb6967d745ed069e12cc5e4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.114.1/runn_v0.114.1_linux_amd64.tar.gz'
      sha256 '42fd7446b20e3f480f5673df35fa48585f7ec34c5028c20c40aaa8b098ffb037'
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
