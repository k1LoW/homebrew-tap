class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.11.3'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.3/mo_v0.11.3_darwin_arm64.zip'
      sha256 'f6ed83f0e88ea274ade4a069d7e3f0842db397aa0c2fa5d024fbd072d23ef6bb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.3/mo_v0.11.3_darwin_amd64.zip'
      sha256 '55213a081b4436452dbb0516e9f41767603631a80910a605657f747165158ef4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.3/mo_v0.11.3_linux_arm64.tar.gz'
      sha256 'd211738114c8b5262769c87e2e4085394a04b8b1d8a026f1ccaf9fac978e66ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.3/mo_v0.11.3_linux_amd64.tar.gz'
      sha256 'd462214f4c4a7238a1a3ba20d22e28e918efb5c6f3bcae408ccee16271e49f2a'
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
    generate_completions_from_executable(bin/'mo', 'completion')
  end
end
