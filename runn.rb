class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.11.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.2/runn_v1.11.2_darwin_arm64.zip'
      sha256 '066f4d8486f583bafcc1409dba0e6fe2d09181ae39cc3c7580420d0d63a90e2c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.2/runn_v1.11.2_darwin_amd64.zip'
      sha256 '39ab27a082661a09a8e3d45758921ee35f14bfd45e502a9612864819267e1ec1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.2/runn_v1.11.2_linux_amd64.tar.gz'
      sha256 '4e6cedd536511a40e1fcb51895a23ab814a7173fc3cd909aeff9cb7fd8dc22e0'
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
