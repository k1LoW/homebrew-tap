class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.56.9'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.9/tbls_v1.56.9_darwin_arm64.zip'
      sha256 '647ad43f93849ddfc64a2c279cf46c17031e4dd18f06eb0229527fd8d92384ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.9/tbls_v1.56.9_darwin_amd64.zip'
      sha256 '7776f907c8148c6bca78afd6e4180b293a43778415faa416e9fe375450bd6356'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.9/tbls_v1.56.9_linux_amd64.tar.gz'
      sha256 '8671d7da72900c99f9e9cceeb8678c807c3fff349ece58793366ebc36f7ed514'
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
