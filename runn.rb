class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.91.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.0/runn_v0.91.0_darwin_arm64.zip'
      sha256 '85a8b5da3bd74dc0751d73104ea96f34e73a0e635140c338dc4e30f7ca18c989'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.0/runn_v0.91.0_darwin_amd64.zip'
      sha256 'e705a41af22737dc652f226f0478794e78f0cfffb30378ebf22592a996b3b96f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.0/runn_v0.91.0_linux_amd64.tar.gz'
      sha256 '131ce325def12616a41b54eca5a0798919721278b7e276bb3245b325e4b1b379'
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
