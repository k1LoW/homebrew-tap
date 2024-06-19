class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.76.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.1/tbls_v1.76.1_darwin_arm64.zip'
      sha256 '5515655d47e15537a0b9121df66e07921be307dddad17bdf04f4c8f07a98fd28'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.1/tbls_v1.76.1_darwin_amd64.zip'
      sha256 '10701c2e820dc03536743a709446ba2ff068a92cfdc8874b826f55d9346653e7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.1/tbls_v1.76.1_linux_arm64.tar.gz'
      sha256 'e28808c5b34b1279f1f1a35e1e3a1efc63277e9f323343b878d19fee827c5524'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.76.1/tbls_v1.76.1_linux_amd64.tar.gz'
      sha256 'ea2c24c355330f153a72b2f327b9524142dafd7f7cc641b410d5c6028519cbbd'
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
