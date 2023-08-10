class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.80.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.2/runn_v0.80.2_darwin_arm64.zip'
      sha256 '506469f697080cb78744a40787f5d49bb9f0c21f695ffee70ae5fd4b3655f4ab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.2/runn_v0.80.2_darwin_amd64.zip'
      sha256 '8209a4a07d6ead50b71b73982b9e05ea3723e3651fb55882361f139c83314e62'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.2/runn_v0.80.2_linux_amd64.tar.gz'
      sha256 'b5a8af95b6fd4101b8c714e9d5def66fe41bd25d04576c450fba8b1069a14cff'
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
