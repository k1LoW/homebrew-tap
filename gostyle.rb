class Gostyle < Formula
  version '0.25.1'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.1/gostyle_v0.25.1_darwin_arm64.zip'
      sha256 'a688d88b5cf18d8af25fbf7f1f27f358f6e1e15f6936d18388318346775fee9c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.1/gostyle_v0.25.1_darwin_amd64.zip'
      sha256 '796096cdc5074fdb745fc8ef0de4d1f1586ee42888c3202203a3f293d99eeb86'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.1/gostyle_v0.25.1_linux_arm64.tar.gz'
      sha256 '998b3967fba1c761dfeab54fca78cb76053bc513abef528feea8f191573e86af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.1/gostyle_v0.25.1_linux_amd64.tar.gz'
      sha256 'ad9787192ef647b263a2ce69190c4bf6dfd026375f6a5495948f3329cd6815aa'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
