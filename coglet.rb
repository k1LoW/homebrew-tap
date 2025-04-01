class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.0/coglet_v0.3.0_darwin_arm64.zip'
      sha256 'c60a18c0901835d4f5f52779c8c7d06fbcb5aba55c3f7e4ebe36a4fc76629f80'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.0/coglet_v0.3.0_darwin_amd64.zip'
      sha256 '95a87368a790064266070b1a7f67e0e8855f591296d7c52b68693b321e48597a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.0/coglet_v0.3.0_linux_arm64.tar.gz'
      sha256 '89d4bc3dc1d3842c4c8a3979b4e0fd83f8d67ee59493f2203a111e8cd297428a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.0/coglet_v0.3.0_linux_amd64.tar.gz'
      sha256 'a80ed4571ed6a15bcf243aeebcd87c275a2cdffb4e4efa75fd82650977bb7988'
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
