class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.74.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.1/tbls_v1.74.1_darwin_arm64.zip'
      sha256 '2686d0ad141847bb8b280dc782f7a2199d31ec6f221d855dc5f5b5bbe44c9a32'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.1/tbls_v1.74.1_darwin_amd64.zip'
      sha256 'e6baaa09fc46f9ed54d7a8c9277236e525c512ba9204c95f5f6c9ff10c54711b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.1/tbls_v1.74.1_linux_arm64.tar.gz'
      sha256 'f6e054543cd4bf8795440902b690c8c7a5482574a46115058439cff7dc449df5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.1/tbls_v1.74.1_linux_amd64.tar.gz'
      sha256 'bff7d4a094de44b98486cc9c84ecae44fd74064ca351d5c5d11dd45d272aa3a5'
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
