class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.9'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.9/mo_v1.6.9_darwin_arm64.zip'
      sha256 '94da891b45a3889bf1bbb908e4e12ccafd1f162b760ce7eb9c471e1b453545b5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.9/mo_v1.6.9_darwin_amd64.zip'
      sha256 '281b1a4e5d30952e1848e8f7e79f9072dcc0a2a3b3ad484ad436f3cafe61a9f4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.9/mo_v1.6.9_linux_arm64.tar.gz'
      sha256 '11ed51448d0963b4f9ebab52eb5c9c8265f5fb37d4710eabf7c9f5bad0305fab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.9/mo_v1.6.9_linux_amd64.tar.gz'
      sha256 'd69a7963cc7be94deedabb335ae5a5780c9dc038e7f656b40ace697876ca0961'
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
