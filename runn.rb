class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.75.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.0/runn_v0.75.0_darwin_arm64.zip'
      sha256 '64ae4750d03c04990c3d491988b87fa81eadcee5a7101c1a5e5c8e837d1fddef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.0/runn_v0.75.0_darwin_amd64.zip'
      sha256 '2fc1d0541c1f206dcc0f21a84c12ecf1c88d140d3b15049b954dfd477962b0e9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.0/runn_v0.75.0_linux_amd64.tar.gz'
      sha256 '497961725fb6e510e2b57974255c2dd837a0efefd4bc733f564a937eefd2e3d0'
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
