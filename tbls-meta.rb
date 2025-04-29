class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.1/tbls-meta_v0.4.1_darwin_arm64.zip'
      sha256 '22bd08e9db950d28509cd67d02e33ecf812a5ac71afb83f6f3f670df9d2f7887'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.1/tbls-meta_v0.4.1_darwin_amd64.zip'
      sha256 '434b7d850b01ca4573a7a85b8352e51ed09487443941af3b418e3b77f6c163b4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.1/tbls-meta_v0.4.1_linux_arm64.tar.gz'
      sha256 '33d44eef78cf355f8090e1c15868e678fa9b0c3ef75c9761e5f0a2be9ed06e02'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.1/tbls-meta_v0.4.1_linux_amd64.tar.gz'
      sha256 '12da4d350578c095f4bfb21469545ced6742955691d53d49d80d1cd8ce996569'
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
    generate_completions_from_executable(bin/'tbls-meta', 'completion')
  end
end
