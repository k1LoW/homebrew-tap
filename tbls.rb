class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.75.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.75.0/tbls_v1.75.0_darwin_arm64.zip'
      sha256 '82f88cd7834392964f4e0b8674d5a5378e7b27c57a5644304b63c1ea75eb88c6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.75.0/tbls_v1.75.0_darwin_amd64.zip'
      sha256 '175e5aada4f63bc0787b893c537d7d580ef117d03c3b9e49172296730094400a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.75.0/tbls_v1.75.0_linux_arm64.tar.gz'
      sha256 '90ec244aba700fbca18945f488c9d39e29889f84fab08805c07b147e432e83f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.75.0/tbls_v1.75.0_linux_amd64.tar.gz'
      sha256 'a3fffe5137614fbaefef98833a0f2ef03aa48aea11f37ca70894197b2fc22b5a'
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
