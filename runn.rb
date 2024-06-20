class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.113.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.0/runn_v0.113.0_darwin_arm64.zip'
      sha256 '771c2be13180e5056f5b4a2379a5850843ba183e586f61b25acf0dc1786c68e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.0/runn_v0.113.0_darwin_amd64.zip'
      sha256 '534f52e4d150e1468ed2b0f9a1776ab1286fa04c1ab6fc44c7ee5619b5c75062'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.0/runn_v0.113.0_linux_amd64.tar.gz'
      sha256 '0e09d01ee25744b009fed81edfdf0b9d75b14b929be1ed103ddce40652c6f939'
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
