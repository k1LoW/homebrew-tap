class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.1.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.2/runn_v1.1.2_darwin_arm64.zip'
      sha256 '2a0ba05daf481de9aa068358e9551b750d890a425f65a537324c831ffda30c21'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.2/runn_v1.1.2_darwin_amd64.zip'
      sha256 '1152c6ad45eb004c3eab0f53bef9865283f38754272fa6af79ebb4bb3d5a4d12'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.2/runn_v1.1.2_linux_amd64.tar.gz'
      sha256 'edc42b1ae054fd66a40a671bea104135a3db6857f9fa8730acab9c98ece5cd7a'
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
