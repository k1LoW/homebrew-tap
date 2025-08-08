class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.10.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.0/deck_v1.10.0_darwin_arm64.zip'
      sha256 '516537097a42d916c0091c3a83b929723dd4c9547788fbc631e471166e98cf14'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.0/deck_v1.10.0_darwin_amd64.zip'
      sha256 '54b547774ea8db6b700fafc74bc84c8e727c253c450778923b048689f76cae6d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.0/deck_v1.10.0_linux_arm64.tar.gz'
      sha256 'a3ea040e3ea7572584ce592073be61731cc121fa8147cb3d02788ad91b253754'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.0/deck_v1.10.0_linux_amd64.tar.gz'
      sha256 'e2df079e6ffaaf46427b22f8670e7b3230420da46fcb9053e42b4dd3d1281872'
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
