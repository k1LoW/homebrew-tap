class Gostyle < Formula
  version '0.1.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.1.0/gostyle_v0.1.0_darwin_arm64.zip'
      sha256 '49f72842e7ccde75d47a42f184565aab7c1cb7af16ddb2f7d354f9925e439698'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.1.0/gostyle_v0.1.0_darwin_amd64.zip'
      sha256 '630263cc654e70e56ba92406010df063d12f35adb97e0e5052d99794fda36de7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.1.0/gostyle_v0.1.0_linux_arm64.tar.gz'
      sha256 'c76c5743ca2805f8b37b516a77d8f31e8baa5e42d16c338246373ba34dbbfc15'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.1.0/gostyle_v0.1.0_linux_amd64.tar.gz'
      sha256 '4d73e5b9f2fda2864f49079a5b7a9c113b5764b9842207cd910d72a20a41e648'
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
