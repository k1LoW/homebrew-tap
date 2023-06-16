class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.66.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.66.0/tbls_v1.66.0_darwin_arm64.zip'
      sha256 'ddf2e1d8c0eee6b02c2659754520201add7691f77ac85e8cb78e90e48dbe3c7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.66.0/tbls_v1.66.0_darwin_amd64.zip'
      sha256 '12cd0b59225266194fd012a67f9a80f5fadd66b89ee4a270be0c8e60c7f4618f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.66.0/tbls_v1.66.0_linux_amd64.tar.gz'
      sha256 'a6c0f39a3fa60076bcf60b500bae8ea9915e55d6427cea204791fbab54b43391'
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
