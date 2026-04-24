class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.9.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.2/runn_v1.9.2_darwin_arm64.zip'
      sha256 '95a92baa01c162eb3d544e26041ae3a743c8a6500ebf9a2703e8587a446556ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.2/runn_v1.9.2_darwin_amd64.zip'
      sha256 'b03a21e5720bbf96b833264e32e8596953e58e771e16e80e9575a5cc0b33e2af'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.2/runn_v1.9.2_linux_amd64.tar.gz'
      sha256 'facca461ad6e078729f9b6ea78396025991a8d0737429fc7e6c05c23c76cbff7'
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
