class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.44.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.44.0/runn_v0.44.0_darwin_arm64.zip'
      sha256 'eec9aa9d28f857b55547c53d46eb570446cda847b05d41a53c6791d45d551043'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.44.0/runn_v0.44.0_darwin_amd64.zip'
      sha256 '93ed506fa070403b3e9325aaa0fa59ca2a2e28f3ce5cdf48e3b57cae47f02d31'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.44.0/runn_v0.44.0_linux_amd64.tar.gz'
      sha256 'eca8a233bcb14be3ad2ed66b8a8f86f94e0e27eea3d61b943ab697756bcd3c78'
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
