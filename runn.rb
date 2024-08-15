class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.117.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.0/runn_v0.117.0_darwin_arm64.zip'
      sha256 '360b63c8fc7f934cee2fa7379c05eee3925480c23b5e5d1b4c6110fc7a9fde2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.0/runn_v0.117.0_darwin_amd64.zip'
      sha256 '611d8e9842c8eb637a0f91f09d5758ca4a808b7984c5540756d53c102f8fff0d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.0/runn_v0.117.0_linux_amd64.tar.gz'
      sha256 '7ba7c433813677bcdba4eaa64d2e72c24b21eddedf2030fa1009e78431b60b86'
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
