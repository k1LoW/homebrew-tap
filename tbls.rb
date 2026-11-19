class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.97.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.97.0/tbls_v1.97.0_darwin_arm64.zip'
      sha256 'b070982d474e84421a2046f45ab67541a0a6df209b2253a7a8f5a6b4b80ad8b9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.97.0/tbls_v1.97.0_darwin_amd64.zip'
      sha256 '2850623e14a8cbef5557034dee11c24dbb4367dcaf0daf04d816bfcc57bda2d3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.97.0/tbls_v1.97.0_linux_arm64.tar.gz'
      sha256 '5fcb86bd466980785c96b41b3d3cf968ec8f6ebeb715511bb7c0b1eb992c0c31'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.97.0/tbls_v1.97.0_linux_amd64.tar.gz'
      sha256 '43c81f408495d9b626d0265a6ebb57c6d1c4a5e072d3eecc3e88825cc6c64e9a'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system './tbls', 'completion', 'bash', '--out', 'tbls.bash'
    system './tbls', 'completion', 'zsh', '--out', 'tbls.zsh'
    bin.install 'tbls'
    bash_completion.install 'tbls.bash' => 'tbls'
    zsh_completion.install 'tbls.zsh' => '_tbls'
  end
end
