class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.103.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.2/runn_v0.103.2_darwin_arm64.zip'
      sha256 'a818fa82d5019b781886ec14b67f2c811449b6b2bba0a4dd5c14a7567f011371'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.2/runn_v0.103.2_darwin_amd64.zip'
      sha256 '49e86a8cb26849b5a091c41b6ab6656cf0bbbddaf5dc598738e2d7eb470515fa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.2/runn_v0.103.2_linux_amd64.tar.gz'
      sha256 '6e6ba323284b80e7b8b9fffa11e7777c84d023e82e1b8a10c6070b3d426ac533'
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
