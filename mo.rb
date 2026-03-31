class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.23.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.2/mo_v0.23.2_darwin_arm64.zip'
      sha256 '9012b70c8153885844fa91c57db010e3f71891cdbe82c001ffe635d9c4f19173'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.2/mo_v0.23.2_darwin_amd64.zip'
      sha256 '2e979ae1edd551d9e7c5b74a82847b382da312205aaf31dc7fffd187500588d6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.2/mo_v0.23.2_linux_arm64.tar.gz'
      sha256 '8eddb460bdfe9fd22bd5e0c9e70990b0b4110df9b13d21e5c09054434a81c236'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.2/mo_v0.23.2_linux_amd64.tar.gz'
      sha256 '0cf4eff01a5257e10312c699666a15e034010aa65f29e9584d1ae6bd8568b5f3'
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
