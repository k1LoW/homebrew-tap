class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.101.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.3/runn_v0.101.3_darwin_arm64.zip'
      sha256 'ec6b4cb7f90cadca277a7bfd33c62c16a68b3683791d34aa84680e8485e65808'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.3/runn_v0.101.3_darwin_amd64.zip'
      sha256 '1da906a52ded5d491b28676b25b946ac1af70904b881b1b7ccb56c71c8f454c5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.3/runn_v0.101.3_linux_amd64.tar.gz'
      sha256 'a36cabd30246a0277cebeb91960f6b0f94aa87a80202604e920db1ca69fb414e'
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
