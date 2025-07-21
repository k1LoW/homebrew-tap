class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.0.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.0.0/deck_v1.0.0_darwin_arm64.zip'
      sha256 '61a242230b52ce2ac2b7c6884bca2951c62b8b72de0a1417acda0cc387b61599'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.0.0/deck_v1.0.0_darwin_amd64.zip'
      sha256 '90892e8191ed2254f856da9592b316ba5f4484722e67fda89aaa17608d78df9e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.0.0/deck_v1.0.0_linux_arm64.tar.gz'
      sha256 '2483c7578ef4bd596564704601bc6ad9cf7e5d05c4f8d49f9f84e1c0a3e4370b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.0.0/deck_v1.0.0_linux_amd64.tar.gz'
      sha256 '8c94de6e5be01902d62ed4b13c0956f0f6b10148d7b3fa6e3546f7079866b41b'
    end
  end

  head do
    url 'https://github.com/k1LoW/deck.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'deck'
  end
end
