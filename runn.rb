class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.124.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.124.0/runn_v0.124.0_darwin_arm64.zip'
      sha256 '2d67d7847ff4d4904d2d6fe4dadbf6809c228c10d39be9e9d1a4480e8a277445'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.124.0/runn_v0.124.0_darwin_amd64.zip'
      sha256 '1ff585183ea02079d4d6022eeb27f59ab23463b7dca14727f3b61c90a3c64303'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.124.0/runn_v0.124.0_linux_amd64.tar.gz'
      sha256 '064305d58b26ea0ff48d2fb939033f09c830b9e892db5705348e9ba0ed930cee'
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
