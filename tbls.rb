class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.76.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.0/tbls_v1.76.0_darwin_arm64.zip'
      sha256 'bea70bf99b2e17820a40e59783220cead90bfb580a924f64f80bf357905347a4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.0/tbls_v1.76.0_darwin_amd64.zip'
      sha256 '0d1c4f28c0d3fdcee3a8e9799f2ae1ae1c0575c484d6197b545a196a1c011802'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.0/tbls_v1.76.0_linux_arm64.tar.gz'
      sha256 '5789904d6d191f2e926859f00c4875837877163c09b2b0518cef70126b031ef9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.0/tbls_v1.76.0_linux_amd64.tar.gz'
      sha256 '133e64a02012fd9147fade8445a707bc4621cf7d03599a044e45fd61ce6698fc'
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
