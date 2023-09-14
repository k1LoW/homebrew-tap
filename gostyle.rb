class Gostyle < Formula
  version '0.10.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.0/gostyle_v0.10.0_darwin_arm64.zip'
      sha256 '4c9eac78393946896b82c062710dbb68c4b840b567ddb751083e2c7609a237ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.0/gostyle_v0.10.0_darwin_amd64.zip'
      sha256 '6abf2ca6c18e0b2e3bed6453113b836c2931a7ab5470a55ea242b19d168e5095'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.0/gostyle_v0.10.0_linux_arm64.tar.gz'
      sha256 'b237f8912dda425f2d392339d0fe060072abe5af7f3081344631e601725e5b82'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.0/gostyle_v0.10.0_linux_amd64.tar.gz'
      sha256 '79a82c1bee9f65fbe75616313286ba682a1d2c6040aec307164790045c2f2d8d'
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
