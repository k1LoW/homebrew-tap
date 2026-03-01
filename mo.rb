class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.5.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.2/mo_v0.5.2_darwin_arm64.zip'
      sha256 '0f642537369a1dfbd9c0185176d533f14aeded23ca3c0bb34b526ff6f2858c6a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.2/mo_v0.5.2_darwin_amd64.zip'
      sha256 '2b25251ffebffdc90f9ee8d3a62bb06c13f2c3ad05723e25855e743c8e241240'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.2/mo_v0.5.2_linux_arm64.tar.gz'
      sha256 'f29eb086584cb0ecfc9813cf9621da6e0f05ad5557c4be4ef84d7eba87abea9a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.2/mo_v0.5.2_linux_amd64.tar.gz'
      sha256 'd8c0b472e606ab66921d9bc7939028f7bd23e83b8cb3600707ebe643665f6061'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
  end
end
