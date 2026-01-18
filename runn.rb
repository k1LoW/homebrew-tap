class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.3.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.3.0/runn_v1.3.0_darwin_arm64.zip'
      sha256 'b066b09f15f0dcdd3f3ff22bd786fbacab65a916097d0043f95555287f652550'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.3.0/runn_v1.3.0_darwin_amd64.zip'
      sha256 '316c2feef9476e34e3015a6ec75997731c17df4632eab47986b09b78ffe5cc77'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.3.0/runn_v1.3.0_linux_amd64.tar.gz'
      sha256 '729509d04db656b83338e162f0836ed4b257d918fc330b3d9c4d307e914ff619'
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
