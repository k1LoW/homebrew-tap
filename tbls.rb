class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.72.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.0/tbls_v1.72.0_darwin_arm64.zip'
      sha256 '0f8f2d92f7782e476c74f768389ded493ef00e2baac126f48194346b6497bf4a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.0/tbls_v1.72.0_darwin_amd64.zip'
      sha256 '78c17493b611fda57ab81073687d74d1d8319d7a0755534323a47494379ff049'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.0/tbls_v1.72.0_linux_arm64.tar.gz'
      sha256 '566ecb27d639f781e0ba795b31482ab7d4275627ca3fa95f2b6c9db474838c33'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.0/tbls_v1.72.0_linux_amd64.tar.gz'
      sha256 '12824108e712f2f8d21258e7c69896460573a58c286053ba419c09301176b6e9'
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
