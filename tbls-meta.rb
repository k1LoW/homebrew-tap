class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.12'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.12/tbls-meta_v0.4.12_darwin_arm64.zip'
      sha256 '7efcf4af4dd448f9d7654baa4cc8184c5209a54aff0a8bf5ed708a6de0423fae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.12/tbls-meta_v0.4.12_darwin_amd64.zip'
      sha256 '3084fe78119361cc10279a8f608ea0eaf6396d6713e8a873e42146a335db3d81'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.12/tbls-meta_v0.4.12_linux_arm64.tar.gz'
      sha256 '030ab35715cbafacf95ebf54d1b28cb0c6ae4407d3504892e2e183bd1efab63d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.12/tbls-meta_v0.4.12_linux_amd64.tar.gz'
      sha256 '875c164014940485c6fadc0bd008a3e433d6644273a327cb9b9e7e68bee6e267'
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
