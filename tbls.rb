class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.73.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.2/tbls_v1.73.2_darwin_arm64.zip'
      sha256 '1aa4cba96f8e615462da4ab9cac1ea004da8a83ffd837abfeaa19e9bb8082a72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.2/tbls_v1.73.2_darwin_amd64.zip'
      sha256 '71eae2e63a6696e16862a2be415f35e298fe60faefcff8b0e29126c3a6a8c5ae'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.2/tbls_v1.73.2_linux_arm64.tar.gz'
      sha256 'af6911ab80bf9571341812129e56cd92e4eacf3df232a9b4f829d44a4f2b00ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.2/tbls_v1.73.2_linux_amd64.tar.gz'
      sha256 '6d1fb3044e9b8f245bea34d28bd1c021bc588e2e57d2bbcf84feeac878c44577'
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
