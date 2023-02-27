class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.62.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.62.0/runn_v0.62.0_darwin_arm64.zip'
      sha256 'a64aaf7766ecdd1794b1ef1464ef3ce903fea0e40fe287cfe80e335bb6e76762'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.62.0/runn_v0.62.0_darwin_amd64.zip'
      sha256 '835d84969dd2a2cf9290a5355079fb2a32eebafd954f52779dd1d6b2e09ee314'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.62.0/runn_v0.62.0_linux_amd64.tar.gz'
      sha256 '3842d58bc2cb0f9da30adc86634f83ee259aec41c83654243192a8b678ae50cd'
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
