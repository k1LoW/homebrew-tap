class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.64.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.64.1/tbls_v1.64.1_darwin_arm64.zip'
      sha256 'd8e498deeeacb0a577244a4ecf92d4a33dbae982ab4b2fb1f97a575fd640d040'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.64.1/tbls_v1.64.1_darwin_amd64.zip'
      sha256 'f49e3eeac18dd2aa2a3b682985c99c7a8dc4d04e8722b7cb024e2d1539c7738b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.64.1/tbls_v1.64.1_linux_amd64.tar.gz'
      sha256 'ee4f273cf5226f3210710f65985ca5dc022b85350e191a8da2921dcf3ca53f46'
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
