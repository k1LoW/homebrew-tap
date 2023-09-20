class Gostyle < Formula
  version '0.14.2'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.14.2/gostyle_v0.14.2_darwin_arm64.zip'
      sha256 'b5258d73e47338c1ff20ad0b81150c9db4093f7feb64589214f48413683413dc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.14.2/gostyle_v0.14.2_darwin_amd64.zip'
      sha256 '66358b7e66e3657bd31637c939527d8db727d6cc23a66cc8878d282e25d33442'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.14.2/gostyle_v0.14.2_linux_arm64.tar.gz'
      sha256 '74460a669e07e2052967c3d0f427b057e253a122983927c175ce71cc95f8fb26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.14.2/gostyle_v0.14.2_linux_amd64.tar.gz'
      sha256 '5ec91c860d492f7b71cfc74f3738dc59aec0864e39ce7c8f9198cee6d860cc37'
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
