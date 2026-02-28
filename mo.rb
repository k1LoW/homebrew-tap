class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.1/mo_v0.4.1_darwin_arm64.zip'
      sha256 '422ad0151064134c3b77b89327e7aa27efac82e9e0948ecadcae5c77de21b2d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.1/mo_v0.4.1_darwin_amd64.zip'
      sha256 'f7322719a9a3732048c61d9af172987ef99544e0d23aa0f622de002e726ec4c4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.1/mo_v0.4.1_linux_arm64.tar.gz'
      sha256 '68fc59aa8443f5d5d22f4527d2e7e71b3390c43a8fcad61605069bd09d3a6031'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.4.1/mo_v0.4.1_linux_amd64.tar.gz'
      sha256 'c92043c6f4dfc2d8fcd9c30298fa529fe0ae25d0f09971c037ed2c9c79999535'
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
