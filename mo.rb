class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.0/mo_v0.5.0_darwin_arm64.zip'
      sha256 '576465883476e20a8246f45cf4b60183373902c110d72f87781f157ec594ffca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.0/mo_v0.5.0_darwin_amd64.zip'
      sha256 '7068f829118cc46e77ba58565b46e32836887080b2cba794bdcc2debfd5173ab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.0/mo_v0.5.0_linux_arm64.tar.gz'
      sha256 '55ed4db456611513e94e9bc3459006ed0f96d04b7c2edcfa2e0a01f2bb9ceac6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.0/mo_v0.5.0_linux_amd64.tar.gz'
      sha256 '6ffcba7d6c45934ea81d276c37a1a3a59b0702e36721778e3f5615646a2cb33b'
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
