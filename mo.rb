class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.15.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.2/mo_v0.15.2_darwin_arm64.zip'
      sha256 '269af735d76362ecac3f74c996331cb1113bef9276ead16e803726b8c06f1781'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.2/mo_v0.15.2_darwin_amd64.zip'
      sha256 '831645767fdd2e72f2ee8cb5d8b40015415b67f930c421aa918d293c2d4de553'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.2/mo_v0.15.2_linux_arm64.tar.gz'
      sha256 'b8ce437c2e5af7b0a6a7e7cb2bd7ae566107f30854d58daedcb574127770c10f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.15.2/mo_v0.15.2_linux_amd64.tar.gz'
      sha256 'a684d73c071cf813a3307d655acd17c8ef9c1698f98f7b0568fe715f6c04f6c6'
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
