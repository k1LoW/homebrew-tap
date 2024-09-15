class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.119.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.2/runn_v0.119.2_darwin_arm64.zip'
      sha256 '9cf22c66132fb6cabc813d18000df8098b839610ac75f80b285ce9000448012a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.2/runn_v0.119.2_darwin_amd64.zip'
      sha256 '2db8fa04d14142528404db4f5a3a990f9f8281c93d3c7644cac7bb12de19919a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.2/runn_v0.119.2_linux_amd64.tar.gz'
      sha256 'a61de80cf51ae90fed0659d0e7f25bc962408d82dc90e0d503e9fdde6cc27c89'
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
