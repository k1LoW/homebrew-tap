class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.64.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.64.0/tbls_v1.64.0_darwin_arm64.zip'
      sha256 '844a74948e99d97e5575c808baa607ba8eecc48589d8fa5a33bee30c6da60ab0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.64.0/tbls_v1.64.0_darwin_amd64.zip'
      sha256 '13eaad29dfc0083d1914a35a52124786912ef9a9c596aa0683abd1ba4f034165'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.64.0/tbls_v1.64.0_linux_amd64.tar.gz'
      sha256 'bec1cd5760c40775a06c500b2e7cb913f341b835e1e30984c18ab6e6243cc300'
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
