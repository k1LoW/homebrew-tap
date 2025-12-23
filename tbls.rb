class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.92.2'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.2/tbls_v1.92.2_darwin_arm64.zip'
      sha256 '76b6bc7174dd06086da00a04eda83a47b4f07f2555609f70b1fed483b8a7eceb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.2/tbls_v1.92.2_darwin_amd64.zip'
      sha256 '70addacb2ede1a830a473063a1a6934ce589578fd3a1759e436f927d2a86fbab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.2/tbls_v1.92.2_linux_arm64.tar.gz'
      sha256 'a8a998d2dabe71e9dfba97281614c991ae1c4e8710a140a26e056ad834d49f81'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.2/tbls_v1.92.2_linux_amd64.tar.gz'
      sha256 'caf706859d582134f6e14dc4e61a0e533edb96ffa8f27d15b958b5898bef1256'
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
