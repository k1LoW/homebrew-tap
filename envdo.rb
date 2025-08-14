class Envdo < Formula
  version '0.0.1'
  homepage 'https://github.com/k1LoW/envdo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.0.1/envdo_v0.0.1_darwin_arm64.zip'
      sha256 'f666f7abb149e5cbd31cf7e8e99259bc452f0a0e30b42201a5e2b2259cf4866d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.0.1/envdo_v0.0.1_darwin_amd64.zip'
      sha256 '40f585ff2e70226891f4ecc11af26f33ff140dc6b6923b82a5ecc94db2a926d3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.0.1/envdo_v0.0.1_linux_arm64.tar.gz'
      sha256 'f0c54dbe86ba3eebbbdfc214701bbfa0209a797985e7d3cb3e66d4a789a4e54f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.0.1/envdo_v0.0.1_linux_amd64.tar.gz'
      sha256 '559a125ca50201c501c636052e374a0908e320ffaae483aa4683abcdfab796f2'
    end
  end

  head do
    url 'https://github.com/k1LoW/envdo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'envdo'
  end
end
