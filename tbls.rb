class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.72.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.1/tbls_v1.72.1_darwin_arm64.zip'
      sha256 'a06d23dfb00a4e7ed22ddb46fe779a4f1190d84af07752fb8358f353db5734fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.1/tbls_v1.72.1_darwin_amd64.zip'
      sha256 '1ab3b59c7228d2d6c3a5380626579e0191464d27e8a34dc0c2394316debfeacc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.1/tbls_v1.72.1_linux_arm64.tar.gz'
      sha256 '3a2ac2dfd9de93b2ca29d838cf4c1c33d3ee6ed5e40806ae79a367a82460651a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.72.1/tbls_v1.72.1_linux_amd64.tar.gz'
      sha256 '278c55833cda938a75b6924a7bc48fdcf8f6b05897f65aff3d68e51c5244f350'
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
