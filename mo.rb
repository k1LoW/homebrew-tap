class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.1.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.0/mo_v1.1.0_darwin_arm64.zip'
      sha256 'e7cdfc5664f1fbb92d9bf09eea720abd8820e699bd8f093996cee49f99426552'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.0/mo_v1.1.0_darwin_amd64.zip'
      sha256 '30362298cd6967b26a522b30a9af973866b59dab7e9f88d6c2e3250381c6fe2a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.0/mo_v1.1.0_linux_arm64.tar.gz'
      sha256 'cc337d133db788cf34646af3e01d2952b46b1fcebca6e3be06c7d9503d905d4b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.1.0/mo_v1.1.0_linux_amd64.tar.gz'
      sha256 '243e3a8fa08dfec69d8bcb8260a4f7e14d3b68d1bef01e18d8ca370121555c40'
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
