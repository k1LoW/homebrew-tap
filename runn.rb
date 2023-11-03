class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.89.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.89.1/runn_v0.89.1_darwin_arm64.zip'
      sha256 '626fbf84cc83a4853476473d5f717f07e8e6520c3caa32d402c1fb2ab43f54d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.89.1/runn_v0.89.1_darwin_amd64.zip'
      sha256 '4eb8bd11b2abb8d239055fca0c12dd198554291a42308b8a0deb4a2d225c92f1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.89.1/runn_v0.89.1_linux_amd64.tar.gz'
      sha256 '818f340f0bd48e8443ef7f5ef6dd34dc1a8a370e78d08597431d96e11a563507'
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
