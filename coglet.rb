class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.4.3'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.3/coglet_v0.4.3_darwin_arm64.zip'
      sha256 '1329c63d639b649c0d7e184a928b5a8fa412134581cf96874a9928b4ebe0f87c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.3/coglet_v0.4.3_darwin_amd64.zip'
      sha256 'e33ae039afbe8ee653e556ed05c7171400d292d2290d29bfaadb5181e73e857b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.3/coglet_v0.4.3_linux_arm64.tar.gz'
      sha256 '4e7b72d975a5e8b3c13c662ac2327b86433238c64646f6889c08f6c8c39b57ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.3/coglet_v0.4.3_linux_amd64.tar.gz'
      sha256 '8634877afd1cec1589caa80e44d15974464e1761b0c7cf0821fc09c76addc4aa'
    end
  end

  head do
    url 'https://github.com/k1LoW/coglet.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'coglet'
  end
end
