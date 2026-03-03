class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.11.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.1/mo_v0.11.1_darwin_arm64.zip'
      sha256 '6108a2c6d5a7db52782f50135f0754c8cdba97093cdecb6fa4730445a0dc6e1c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.1/mo_v0.11.1_darwin_amd64.zip'
      sha256 '1388f96d68d5c94f30eb68588f09817fb5ab2b2de7994cfe2ecf0a0cd4edb75d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.1/mo_v0.11.1_linux_arm64.tar.gz'
      sha256 'ea15fce4ce815c5f69047c1be58594c50d41a83b4d9f87ef94fb8f48b2d16b64'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.1/mo_v0.11.1_linux_amd64.tar.gz'
      sha256 '34b26be88a61d99431610b8f3a88a3515374087e74420f88ff2ae41816b06535'
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
