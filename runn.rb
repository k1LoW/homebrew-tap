class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.59.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.4/runn_v0.59.4_darwin_arm64.zip'
      sha256 '99d960cec040a9058df53f55f92b6f4a478b01e1ba56b099b44a654f666e92f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.4/runn_v0.59.4_darwin_amd64.zip'
      sha256 'fc04602c2d3809a75b4ac52096b872a0874f0134526f8b64cf3cb51af3e63daa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.4/runn_v0.59.4_linux_amd64.tar.gz'
      sha256 'e870acdbc86aaa5f97a8c5d52b3f277f99267e6521c3526f87ccc2bb205408d2'
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
