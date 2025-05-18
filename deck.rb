class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.17.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.2/deck_v0.17.2_darwin_arm64.zip'
      sha256 '2a6ea62e986c2a404087f58cdf07713ca9cdb762c7f3bee799edcf21a5c330b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.2/deck_v0.17.2_darwin_amd64.zip'
      sha256 '289c6058634d3489b5340921cbd26a50b127a7c1c38c9e377f60f81f0c422d94'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.2/deck_v0.17.2_linux_arm64.tar.gz'
      sha256 '63b5c928590b6f0b5f7d77016acec6765e94d11c950f18cb19112d2ac452e551'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.2/deck_v0.17.2_linux_amd64.tar.gz'
      sha256 '20eddd27ef0eabf519e8931cca93def3d800509e9889b9ad0125347e2b5f8c17'
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
