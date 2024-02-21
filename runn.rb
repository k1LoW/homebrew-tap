class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.99.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.1/runn_v0.99.1_darwin_arm64.zip'
      sha256 '9b5fd76f3fcb20e09661e4d29129ac3331837fa7c660f73e4a9290c0d0d55fb9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.1/runn_v0.99.1_darwin_amd64.zip'
      sha256 '8b39ad14f97fe3a3291931b6e3a4de407956268cd93a69eace4d1ae796ef445a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.1/runn_v0.99.1_linux_amd64.tar.gz'
      sha256 '500efa99cacc7db47426dcb252db3b039b208ec9fc92e8599a5978e8b8a40dd7'
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
