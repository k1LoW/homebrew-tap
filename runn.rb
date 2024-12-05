class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.122.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.3/runn_v0.122.3_darwin_arm64.zip'
      sha256 '1b2be6472f0be05959f4f64b17c4d5a7e50ece07feab3ec4f461701b099c11e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.3/runn_v0.122.3_darwin_amd64.zip'
      sha256 '87b895c47f875ec1db0497697ad279164c540c311d5e694b00e0c9e47f36e48c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.3/runn_v0.122.3_linux_amd64.tar.gz'
      sha256 'f8416ea6e841e378237185ef436e654e08e473cd2efd25728640d7411e3e2308'
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
