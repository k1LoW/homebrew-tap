class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.140.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.3/runn_v0.140.3_darwin_arm64.zip'
      sha256 'ea316ef8ebbce3bc9f82ac74b380a259c5a93b8aa6fce37f5b3a958748b3eb6a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.3/runn_v0.140.3_darwin_amd64.zip'
      sha256 '151cbbbc262fb989759ef957c350c5fe3b61913f9b3b5498f82c69bf817eac26'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.3/runn_v0.140.3_linux_amd64.tar.gz'
      sha256 '0c3b736c0475a8bdcdcfb68ed3e1ca3d0451b9359de4e3474c0ab85e45108631'
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
