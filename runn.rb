class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.126.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.126.0/runn_v0.126.0_darwin_arm64.zip'
      sha256 '5b8b21731999f0485e037d2c68084744fbbf84088dbf36782b1dcccaec305d11'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.126.0/runn_v0.126.0_darwin_amd64.zip'
      sha256 'c4319ca2697499f847818fe6f208733435ae16990d2017fd88a3611403911cfa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.126.0/runn_v0.126.0_linux_amd64.tar.gz'
      sha256 '0b3c60a72f761a890c7b20e0169a4b828f5c7530aaec2d1a1f621c84cdc10271'
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
