class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.11.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.1/runn_v1.11.1_darwin_arm64.zip'
      sha256 '09047d473e2eae5b45d8a1ce81b78ae568357f755a451b50eceb27117ca1e10f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.1/runn_v1.11.1_darwin_amd64.zip'
      sha256 '69519ca01fcc55cbe72820842c465b306216e77f297b5a1b10a6a78092d3d6c5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.11.1/runn_v1.11.1_linux_amd64.tar.gz'
      sha256 '3bdb4a48368ba45831c69719f0c72228c7c8405338ff27f7369095ccf07ea248'
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
