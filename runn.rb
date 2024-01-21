class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.97.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.97.0/runn_v0.97.0_darwin_arm64.zip'
      sha256 '774f812b95b28d3c426751aa449cba1a9e8fef7f6f27be0eee2ce2063c131256'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.97.0/runn_v0.97.0_darwin_amd64.zip'
      sha256 '4d41306da962109b9e39da86a2d0b0ec0d31c2b766f33109aa66e439d43d4eef'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.97.0/runn_v0.97.0_linux_amd64.tar.gz'
      sha256 'd5a9b23775df494c5c407b0ec7ba04d54e9998bac1b8f69ddf8bef9777c8a6fc'
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
