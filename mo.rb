class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.6'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.6/mo_v1.6.6_darwin_arm64.zip'
      sha256 '6fe2235449a28e282b9bd5ec1a7c5d4649eb58fb381c05d757faf31241a019bd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.6/mo_v1.6.6_darwin_amd64.zip'
      sha256 '86f7df2aeb3c699d2fdc09a83a7a5a89a479ee99a7ff5c7c59a84ab2c71956dd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.6/mo_v1.6.6_linux_arm64.tar.gz'
      sha256 'c0d957af46744d09a092f08613c6f4639e9eb1059bce2a408a9f4d900edaee27'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.6/mo_v1.6.6_linux_amd64.tar.gz'
      sha256 'efaacf08ccb828811dcd2b5bb0b82e764e54bcf545bad3a5d1ade39918f2796c'
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
