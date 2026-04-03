class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.23.3'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.3/mo_v0.23.3_darwin_arm64.zip'
      sha256 'fc7e5380f9d45cf47a7db9239f6502352b2f0f833f7d42c6c19556e997fb93b5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.3/mo_v0.23.3_darwin_amd64.zip'
      sha256 '36df3fda2730006e46d895b0df966462d1f8d487c594e0d3547a71a2127fc063'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.3/mo_v0.23.3_linux_arm64.tar.gz'
      sha256 '7e996d6a422fed2d665635f422c9420a19eb9e98766074db223a8d349f95fc95'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.3/mo_v0.23.3_linux_amd64.tar.gz'
      sha256 'ed2b15bb1c67d496db1064b2affde4b202916e520b96f76c20877c45673e8a25'
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
