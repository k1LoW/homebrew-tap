class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.98.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.4/runn_v0.98.4_darwin_arm64.zip'
      sha256 'c69703f2120fda3fda5b0c64082f32e4e4ece83c3095960b4609f6ef36f2c88e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.4/runn_v0.98.4_darwin_amd64.zip'
      sha256 '8f77177c486f8847741ed8ad230ce159eb3e49b18639053c70b21f3053b24db5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.4/runn_v0.98.4_linux_amd64.tar.gz'
      sha256 'b9a6d6007e95e016ad8689881ab7c6b42b4f3c93c220522ff8549d98c9df350f'
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
