class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.134.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.134.0/runn_v0.134.0_darwin_arm64.zip'
      sha256 'be9c8b3f6cd4b4f2847bde167e368fa1d09a916d83b726ec3f272cbe30817c09'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.134.0/runn_v0.134.0_darwin_amd64.zip'
      sha256 '97586f4b2c22542fd4dfff278f42db4bdf02de6003533bfe71df751de53727fa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.134.0/runn_v0.134.0_linux_amd64.tar.gz'
      sha256 'bca931d3e461e5895bb1c24317ce8c2a63d395509bf65e2db27af1834034cf33'
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
