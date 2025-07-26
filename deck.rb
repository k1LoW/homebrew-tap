class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.4.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.1/deck_v1.4.1_darwin_arm64.zip'
      sha256 'ac43c0b71370aaff38641492ed2ce825807c9568cdaaf42693ebc80c04fa43ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.1/deck_v1.4.1_darwin_amd64.zip'
      sha256 '023afed01b8cdc67ebb041febb666a14a207b790ae3df032323561f7c10fd2df'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.1/deck_v1.4.1_linux_arm64.tar.gz'
      sha256 '58e313ce99f6253fc9fb66713f69676f938a0ac767d2df67d8b2e06680ea4344'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.1/deck_v1.4.1_linux_amd64.tar.gz'
      sha256 '9c3be36eb805322ccaa2f3f369c69d04a2d4d027e43112c630776122b0007ed7'
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
