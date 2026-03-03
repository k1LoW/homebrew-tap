class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.11.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.2/mo_v0.11.2_darwin_arm64.zip'
      sha256 '38d94fac425ca8711dc039f5c1afdb7e625718d126401ad129bc6fcf902dc14d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.2/mo_v0.11.2_darwin_amd64.zip'
      sha256 'f44683aad5fdc83ceccd98e0bfde7a51efe06a173665ebc51c31baafc31ab290'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.2/mo_v0.11.2_linux_arm64.tar.gz'
      sha256 '3d891b3ce1009ff0c35aa559861ad1da2da8841861a084dea3cc2d9ffe528209'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.2/mo_v0.11.2_linux_amd64.tar.gz'
      sha256 '19bda756c0f58ef0576c716a9cb3cec82a40cd5303b9ef009825244c12fa62d6'
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
