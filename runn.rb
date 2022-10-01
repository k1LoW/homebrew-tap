class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.37.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.1/runn_v0.37.1_darwin_arm64.zip'
      sha256 '87d5dda3a9ecd86a3d5cb5388ccb3464c85d559672498efb1e878ecafa8604b7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.1/runn_v0.37.1_darwin_amd64.zip'
      sha256 'dcb5d44c90d18d65213b3470271213c2116c974adc10aa2b0df5089363e7f154'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.37.1/runn_v0.37.1_linux_amd64.tar.gz'
      sha256 '20ccb648edfedbbdee187dce737e1a0c35c00d35fcbe8c4f9577f82557f2cc69'
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
