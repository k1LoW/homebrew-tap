class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.76.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.0/runn_v0.76.0_darwin_arm64.zip'
      sha256 '71e238867790cf218f085e5f7a5e0d212ed3dd11204f20a3b9e96d7408f71649'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.0/runn_v0.76.0_darwin_amd64.zip'
      sha256 '05e0c683d5d36e517870864cb6806796311161b2f6a53bfe95b6b5560db4f780'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.0/runn_v0.76.0_linux_amd64.tar.gz'
      sha256 '7282a3cc37a983432f746363b34b05587313a79eebfbf0d6ff1bad6b955094aa'
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
