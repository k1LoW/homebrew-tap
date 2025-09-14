class Gostyle < Formula
  version '0.23.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.23.0/gostyle_v0.23.0_darwin_arm64.zip'
      sha256 '5a30adde721d28fc0a2b2f2089a6af130c881568fc60d604d390d871d9cf421f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.23.0/gostyle_v0.23.0_darwin_amd64.zip'
      sha256 '1fbdf3825ae2fe3f01a32872a9273a048f407965b89c081076f1b444b358586c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.23.0/gostyle_v0.23.0_linux_arm64.tar.gz'
      sha256 '7e4193ae0025dfc4dedc717338c0059598528218667b161f8e0cdf09d8ac844e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.23.0/gostyle_v0.23.0_linux_amd64.tar.gz'
      sha256 '5d82c0d7c72948c1ce83945e25d35446f8ebf2974dcad4fab16c3d6a4f8a6ab3'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
