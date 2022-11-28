class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.51.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.51.0/runn_v0.51.0_darwin_arm64.zip'
      sha256 '567d9cacb38ac11196c5025c404f299e2b7fa69ccb369852684caa218b0c3815'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.51.0/runn_v0.51.0_darwin_amd64.zip'
      sha256 '80f0a620a49716d4b10901f2d569a3eb49d136861fb554b5c4b2e8df80111841'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.51.0/runn_v0.51.0_linux_amd64.tar.gz'
      sha256 '2ac0b26fa4668fbe54b271d2d7101c6fa5de561f72445c89d74f741efcda3207'
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
