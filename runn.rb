class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.108.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.108.1/runn_v0.108.1_darwin_arm64.zip'
      sha256 'ca67c62aef3d778dc8107f8fc1d7e3536174e05ade7bf0a7eb307f2bf5afbd91'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.108.1/runn_v0.108.1_darwin_amd64.zip'
      sha256 '978613d0f1c5498c8ecc709495e8bc823c5de567596789b9bf2fa346a934fb25'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.108.1/runn_v0.108.1_linux_amd64.tar.gz'
      sha256 'b4936952287b53bbffa0f5bcef158057ea1e452b0474772712b94884cd4e26b0'
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
