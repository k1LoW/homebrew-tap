class Roots < Formula
  version '0.4.0'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.0/roots_v0.4.0_darwin_arm64.zip'
      sha256 '2b8557b147bd6227aa9b1c27acd1202b418319405cde64dcfbc3b11924eaaab3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.0/roots_v0.4.0_darwin_amd64.zip'
      sha256 'bd912cae8303a78db1dbd403e37e70eb0fec4631f4e91aa6fbdb5b7150c0eae0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.0/roots_v0.4.0_linux_arm64.tar.gz'
      sha256 '9c6149923e3b7e2b215d03b739bbed708c03827b2666286585e75edb120a7381'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.0/roots_v0.4.0_linux_amd64.tar.gz'
      sha256 '57fb62df5fbcd4762759f7f0942bd1c25ab287451057dec4bf0fb3f7a37e431b'
    end
  end

  head do
    url 'https://github.com/k1LoW/roots.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'roots'
  end
end
