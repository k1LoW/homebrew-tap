class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.2.3'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.2.3/tbls-meta_v0.2.3_darwin_arm64.zip'
      sha256 '5903babecaaddb3c5d779722c20dccfe9a93a7f1f37171e7ba319b750f7bad00'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.2.3/tbls-meta_v0.2.3_darwin_amd64.zip'
      sha256 '2cfa5712d8080058acf4db40236e06bdb7816a636c8a5e577a64b96da4621d19'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.2.3/tbls-meta_v0.2.3_linux_arm64.tar.gz'
      sha256 'a9cc5bd9d059599409ea21187ee80b2b4ec1acabcb37b85f7ea2f4af7e589edd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.2.3/tbls-meta_v0.2.3_linux_amd64.tar.gz'
      sha256 '627db7f0a97be701e03fb9242c3ba1328f083744cfca17c01c2b57874b0597f5'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-meta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-meta'
    generate_completions_from_executable(bin/'tbls-meta', 'completion', shells: %i[bash zsh])
  end
end
