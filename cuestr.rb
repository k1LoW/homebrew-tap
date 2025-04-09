class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.1/cuestr_v0.4.1_darwin_arm64.zip'
      sha256 '40504d53d612a9c2e718a6b6f2455225f067e65cf13d8b0a9b1588e2df99744f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.1/cuestr_v0.4.1_darwin_amd64.zip'
      sha256 '0b8fef93cd2ba2208642c3c3cc294ebf38d0bec905ea66bb0a111eadefa090ab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.1/cuestr_v0.4.1_linux_arm64.tar.gz'
      sha256 'c56a41155189832796f8bf54474cce1fc9152c02e20320361c6fc02f4ca8cad6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.1/cuestr_v0.4.1_linux_amd64.tar.gz'
      sha256 'c4b71e0f366177dab44d00d56d5769ddb8ccc82ab21b91ecedbbed8974bcd171'
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
