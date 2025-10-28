class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.140.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.2/runn_v0.140.2_darwin_arm64.zip'
      sha256 '2c40aded17f936d1e6b0c2f33acc9ce8ba55f3451d4b59efb7b599afb7dddb9b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.2/runn_v0.140.2_darwin_amd64.zip'
      sha256 'd54063fc68218cb8bd7960ab5604a73c3a91ece754cab3f5eb08504e60610abc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.2/runn_v0.140.2_linux_amd64.tar.gz'
      sha256 '021229020cef7288d169c5f64d29099384a373afe9593315cf65c53a103d7d3a'
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
