class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.45.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.45.0/runn_v0.45.0_darwin_arm64.zip'
      sha256 'd2515aa3cfff20211f37968ba553f9f6ba852b07f1d9a62bf1f70d4a588424c6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.45.0/runn_v0.45.0_darwin_amd64.zip'
      sha256 '284eebcc4a82d4dc687f351913db2af38b8028b86e82031615747d4287f8ea59'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.45.0/runn_v0.45.0_linux_amd64.tar.gz'
      sha256 '6114768d53c755ada0e65c5af91e68bf8be2a165abf03fad63a4ca7e750755e9'
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
