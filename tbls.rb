class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.96.1'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.1/tbls_v1.96.1_darwin_arm64.zip'
      sha256 '99d1d53b02e06635d4d94e2823fecc78b3249e996b1785a199ba1868f9f28a8f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.1/tbls_v1.96.1_darwin_amd64.zip'
      sha256 'c744731de4f96517acac234d65175eb9084968abd1a77268d75007b0443a4241'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.1/tbls_v1.96.1_linux_arm64.tar.gz'
      sha256 'f5da6e28b787ca934326870f7b69812c76e097d35a8ae612533108060f76850a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.1/tbls_v1.96.1_linux_amd64.tar.gz'
      sha256 '18285eef0ba7d917214e8bd7dd6a22afe5fea021eed52e7149100a3d10a2af95'
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
