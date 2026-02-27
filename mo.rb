class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.1/mo_v0.3.1_darwin_arm64.zip'
      sha256 '11473ce7349ab8d5ee917bdea2e2e2b8febdb2a725f2825135b6b4ba5ba00256'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.1/mo_v0.3.1_darwin_amd64.zip'
      sha256 '4bcc3ec5ed513f8d9ffc3fecd46cbbd3e55e11287a437dd878d1b76de47e0323'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.1/mo_v0.3.1_linux_arm64.tar.gz'
      sha256 'dcfb3a93251a3c6526121ddbe8b4361da2cbc337b3763a59a83ad7c565031ef5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.1/mo_v0.3.1_linux_amd64.tar.gz'
      sha256 '895bdede00a59b6890772a97156ce3dd78d0f5a07dfbc55daed5175644127be3'
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
