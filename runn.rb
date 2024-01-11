class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.95.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.2/runn_v0.95.2_darwin_arm64.zip'
      sha256 '1d570ccb58027e35747664ee11c4fbf180f35278e41b7b80f194459ebf86c378'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.2/runn_v0.95.2_darwin_amd64.zip'
      sha256 '948c88687690519f50fa4f461065aec5d0522549016a51fb8524d9424c546ee3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.2/runn_v0.95.2_linux_amd64.tar.gz'
      sha256 '54227aab98bcfeb0cfc6dada749dea3f47db5a3377c64008160bfc3a8ae2e864'
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
