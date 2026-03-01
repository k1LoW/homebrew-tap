class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.7.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.7.0/mo_v0.7.0_darwin_arm64.zip'
      sha256 '4fbbe5771053d988c6b12b6e8f91114faa3cdaae5abe8a68728b4bf69885c37f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.7.0/mo_v0.7.0_darwin_amd64.zip'
      sha256 '76665024b4f983aa43e2b0d672001ed11ef4b88a19b1f48108523d7aa550bcbb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.7.0/mo_v0.7.0_linux_arm64.tar.gz'
      sha256 '86adda68900299bf674013d492103f001bde2703b0f6adc82ceb58ea2a5bdf34'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.7.0/mo_v0.7.0_linux_amd64.tar.gz'
      sha256 'ccff59739c75ef04e7a3a1741e1d1de6a90a0053da21ad84f39629545ede6746'
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
