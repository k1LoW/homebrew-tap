class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.56.3'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.3/tbls_v1.56.3_darwin_arm64.zip'
      sha256 '0e49b4c85606c46249c67a57833ef87b0d7bb3912812484925b0a7eafec7ac06'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.3/tbls_v1.56.3_darwin_amd64.zip'
      sha256 '58f3b39bb3b726e23bfb82e7e30dc6c00304a2e54fa6b33e2f62916e1e42e105'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.3/tbls_v1.56.3_linux_amd64.tar.gz'
      sha256 '2a5e8c5642fdf6446659574047eca506747dbc34e1bb16f68b6cc48208f9dca2'
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
