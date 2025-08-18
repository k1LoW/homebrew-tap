class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.15.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.1/deck_v1.15.1_darwin_arm64.zip'
      sha256 '461f72b81a13cda69cde1fa9bfcb96768c22798e0631209a01778b7a1b5b88c0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.1/deck_v1.15.1_darwin_amd64.zip'
      sha256 '6b319778e591e0af7ce05637cd07ff405b7859dae24f11ce57187286225b7c2d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.1/deck_v1.15.1_linux_arm64.tar.gz'
      sha256 '4b5f4b72499be90a913a73de07723257c47d677079f768237b95b16c258e2949'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.1/deck_v1.15.1_linux_amd64.tar.gz'
      sha256 '516d86e636621cb2e7a7ec067424ba027a9f89a2600cea86e88fbd101a2def42'
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
