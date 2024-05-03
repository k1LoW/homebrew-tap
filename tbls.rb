class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.74.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.2/tbls_v1.74.2_darwin_arm64.zip'
      sha256 'f3853b7e00366fe1161bc8df10198f9493bc4feb40f8cbbcc20547cf0cbc0d8c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.2/tbls_v1.74.2_darwin_amd64.zip'
      sha256 '273768de7df467a16facbe1c26cf575d06cc1116db6740f736cd997d101b2e0e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.2/tbls_v1.74.2_linux_arm64.tar.gz'
      sha256 '3797ee0b477ae73bbf37b0e14dcd1e3397a0e7337f8b91bbff2fddb3e03aa226'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.2/tbls_v1.74.2_linux_amd64.tar.gz'
      sha256 'b74429f68f139078f624a365d5b18b35c0f2e42dceb65d770278eda8f31fc492'
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
