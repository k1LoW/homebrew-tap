class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.11'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.11/tbls-meta_v0.4.11_darwin_arm64.zip'
      sha256 '2d1afcf8ea829a00ff83a6acf8f6f89639c28cba2f698136f1f8d5b7dc974580'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.11/tbls-meta_v0.4.11_darwin_amd64.zip'
      sha256 '4743803302d62bafdc7df36bcb320b17520601fd268faa19f751776356cd7342'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.11/tbls-meta_v0.4.11_linux_arm64.tar.gz'
      sha256 '0cf78d35c5571acd9eed7932e71d1049a8e3c6480f35196940aa78e8feb77ad6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.11/tbls-meta_v0.4.11_linux_amd64.tar.gz'
      sha256 'a56562bade4869344da424fcc92f18132daf7747157153fb7d4b4999ea633d0e'
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
