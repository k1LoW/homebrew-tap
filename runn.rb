class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.90.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.1/runn_v0.90.1_darwin_arm64.zip'
      sha256 '17c0b2e4df13f675686ee4e2b407525a9930dea5b7540bf30fc8be018a2e8d2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.1/runn_v0.90.1_darwin_amd64.zip'
      sha256 '1e4a5a38dc8507820f02a61378669256744a077245d6dce745ec6fcbad1cfeae'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.1/runn_v0.90.1_linux_amd64.tar.gz'
      sha256 '7c628f8cc1c4281eff612d588f25d7fe4f11ffd43ef4c92f3d80e4cd06aaf20e'
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
