class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.72.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.72.0/runn_v0.72.0_darwin_arm64.zip'
      sha256 'c2006848f845a656eb0ef284c9352799daf1093697b07b1b00e805930e428125'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.72.0/runn_v0.72.0_darwin_amd64.zip'
      sha256 '1e764d0944afa6fdcb0a3e0e3da0a8bbca4259a2643a66b7f6e3335db56944ac'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.72.0/runn_v0.72.0_linux_amd64.tar.gz'
      sha256 '1895b029a1d6d76685580615ac1708dc2c9f5fc1455497c8d5c5a1b29556475b'
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
