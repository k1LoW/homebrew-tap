class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.119.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.1/runn_v0.119.1_darwin_arm64.zip'
      sha256 '76148635b56eaa35cefd8963db041fa09cd4d7006c9ea658c7b1c6acb2f89be1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.1/runn_v0.119.1_darwin_amd64.zip'
      sha256 '83adfe4fb5de4cec44a61987a10f5eef9b8fdd82bac8f3a10972024c5245561a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.1/runn_v0.119.1_linux_amd64.tar.gz'
      sha256 '5c4242169636e8d2961c9aca6063984034f68445682aa627b94c1098bdcc4dc5'
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
