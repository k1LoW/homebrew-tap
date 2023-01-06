class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.55.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.55.0/runn_v0.55.0_darwin_arm64.zip'
      sha256 'b8b01cd562f81504fd96feb5312cf5635e7197994a9c89e7b960b554d3330822'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.55.0/runn_v0.55.0_darwin_amd64.zip'
      sha256 '6492c4851d82d97488b55dd9449bdf4b3f326e891562f175e620b7e1975e8ce6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.55.0/runn_v0.55.0_linux_amd64.tar.gz'
      sha256 '98da41bee72e9a2694693566fda208ab5007658b8ddb4934812ebbca9ec5ecae'
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
