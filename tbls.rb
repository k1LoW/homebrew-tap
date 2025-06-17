class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.85.5'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.5/tbls_v1.85.5_darwin_arm64.zip'
      sha256 '72275cc0e623b48bfaf19bcfe24cf2586bb980611f7619dd56dbe9cf63166b87'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.5/tbls_v1.85.5_darwin_amd64.zip'
      sha256 'b7549c6f73c11240fc05220df511baf6f48bbd5e205ccd635654d1a6ea10d475'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.5/tbls_v1.85.5_linux_arm64.tar.gz'
      sha256 'e6ed95656d7f342295914f5b76025437c2afd1b4f5987de36512787c674dfed5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.5/tbls_v1.85.5_linux_amd64.tar.gz'
      sha256 '963ddf8ccd7efdb906cf140bb8cb7a3e4d593cb7a13e67566fa0fd6c8338c745'
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
