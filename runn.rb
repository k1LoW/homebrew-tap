class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.125.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.125.1/runn_v0.125.1_darwin_arm64.zip'
      sha256 '60fd2b4ef5046bd507fe0a4f2b229574b83c0b15873323515e5c4d06d41567dc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.125.1/runn_v0.125.1_darwin_amd64.zip'
      sha256 'f689f72e69818c4dc2cd65ffb0706c47ec9f81e7b66b68f7e25c2207f9513fe2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.125.1/runn_v0.125.1_linux_amd64.tar.gz'
      sha256 'e8d2fc4a5c5c3bd194804dd730b797232bc2ccb0cfbdefd934e3510b1f36ba87'
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
