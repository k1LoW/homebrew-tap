class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.84.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.1/tbls_v1.84.1_darwin_arm64.zip'
      sha256 '062157dc41860f62a60a5378ca23149eab7afe914c7c3d7ebdbee0794a755046'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.1/tbls_v1.84.1_darwin_amd64.zip'
      sha256 '153223c1a0e0fb357bcd27ffdf38be8d77530fa252abbd6faaec7f9592fc331c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.1/tbls_v1.84.1_linux_arm64.tar.gz'
      sha256 'cfb1354e0966e2e2dffabb98929db6c495381ebbc0c049735f52b5c1dc5df4d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.1/tbls_v1.84.1_linux_amd64.tar.gz'
      sha256 '3ca3b608a032a641554591468e1db5685c616b558cc4f42814bfbe1bf2a67eba'
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
