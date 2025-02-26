class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.1/cuestr_v0.3.1_darwin_arm64.zip'
      sha256 '1e051a2fdce619f892462fe02ee4b2ffa1f1cb71d785d335340c447f36d6af45'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.1/cuestr_v0.3.1_darwin_amd64.zip'
      sha256 'eba38a324864743bf8b8abab14692b2c6fb6e0cb42f86a754423a271f9e0cd29'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.1/cuestr_v0.3.1_linux_arm64.tar.gz'
      sha256 '5b59d29ff8eafe94f8f18625b3c0455eb80e58bece199201347d5260eb101abe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.1/cuestr_v0.3.1_linux_amd64.tar.gz'
      sha256 '779f7171f273a77dc6c862793e536acb85740575fba2cc7155ddcdeae6caf3f0'
    end
  end

  head do
    url 'https://github.com/k1LoW/cuestr.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cuestr'
  end
end
