class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.5.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.5.0/runn_v1.5.0_darwin_arm64.zip'
      sha256 'cba2ea74d625aa9991a52909fae9196bba5fde4fe15297db729572877829612f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.5.0/runn_v1.5.0_darwin_amd64.zip'
      sha256 '33f28ba0b880385097746fd54626df50dff470cfb8685bc1313cb4aa7e1bb439'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.5.0/runn_v1.5.0_linux_amd64.tar.gz'
      sha256 '5ddb1570dae7df60a30c5415d826dfe32c99415243996c216cd6314b594ca731'
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
