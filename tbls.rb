class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.69.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.69.2/tbls_v1.69.2_darwin_arm64.zip'
      sha256 'bbc04558e5d44907697d7f22ad1b3e3ae9a3d1de72bf8f11398bc34931e13906'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.69.2/tbls_v1.69.2_darwin_amd64.zip'
      sha256 '6e557522804c301ac02b9f7d92e57314c8d88c2a355af835599d63f1865517a7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.69.2/tbls_v1.69.2_linux_arm64.tar.gz'
      sha256 '24c6e7a1ce8a3b964e7517e94754f65aa7ca1e7a3baf99f88f91bcd58f726054'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.69.2/tbls_v1.69.2_linux_amd64.tar.gz'
      sha256 '55b9b3779077ca07241ab6922c175538d523ce5a045405292d6550afb3f1f3c1'
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
