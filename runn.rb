class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.128.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.3/runn_v0.128.3_darwin_arm64.zip'
      sha256 '3fc41c36e8abbac07aaf93bb57c7fb1ad07f6b239ae4a85efb1c275ebee8216f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.3/runn_v0.128.3_darwin_amd64.zip'
      sha256 '5f267cd21754ffa0d028b68d636a6fa2f35958f4e9235c2816327f8c0b30b367'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.3/runn_v0.128.3_linux_amd64.tar.gz'
      sha256 '1ffff7064f6e41743c346e4c35e3f1f37f113f916d946061a2f3078334136650'
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
