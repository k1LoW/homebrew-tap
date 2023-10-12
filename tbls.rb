class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.70.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.1/tbls_v1.70.1_darwin_arm64.zip'
      sha256 '9df1484991821c6e0c09924836f30ba651aad7a3ed575008cb21215bb4c81cf1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.1/tbls_v1.70.1_darwin_amd64.zip'
      sha256 'ca4901650bfb44494009d3bc3887d053d8ed96a330b1a50d41e6ce2b316e90fa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.1/tbls_v1.70.1_linux_arm64.tar.gz'
      sha256 '879873156080c377036da2e24cd030fb5915101355666d4ef4242aa19bf34545'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.1/tbls_v1.70.1_linux_amd64.tar.gz'
      sha256 '42d961baed243435fa9aa5ab5b066de2769d3777831901c4dc7c400519f36137'
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
