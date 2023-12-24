class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.91.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.4/runn_v0.91.4_darwin_arm64.zip'
      sha256 '663c0edf36442d91923bb63286344430068d0016424341aa4c215af9fccfaf99'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.4/runn_v0.91.4_darwin_amd64.zip'
      sha256 '39225ff7ee2b051d047be9c273fb5b2b7e1bf32d3ef02a4b3fe49f13e70b3c46'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.4/runn_v0.91.4_linux_amd64.tar.gz'
      sha256 '9b0db557bb3c68a674b220f76c4aca76a82d956ba458ac8db52ba816c6f212e1'
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
