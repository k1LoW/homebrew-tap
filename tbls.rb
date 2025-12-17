class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.92.1'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.1/tbls_v1.92.1_darwin_arm64.zip'
      sha256 'b2243cc4bf7d00ac01f3e96eaee0de51529ce3f6b414c41604ee676001d8c06e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.1/tbls_v1.92.1_darwin_amd64.zip'
      sha256 'd932c73a293246b407b2fcebf05190020404e383f17a0445cebc349b0b08ad18'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.1/tbls_v1.92.1_linux_arm64.tar.gz'
      sha256 'b652b3dc70eb40983f69e35d13c377fb83b38018c080eed00f229fcefc4a3b59'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.1/tbls_v1.92.1_linux_amd64.tar.gz'
      sha256 'a488568c0da443d35bcf3c994f61fa837197b85994448bf949f8e01066a8bf22'
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
