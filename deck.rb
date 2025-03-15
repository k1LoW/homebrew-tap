class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.5.0/deck_v0.5.0_darwin_arm64.zip'
      sha256 'c209ac96083edfb6cdc351c3e3d2c171ff2e87ab4476ecfe77434939d5ab3917'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.5.0/deck_v0.5.0_darwin_amd64.zip'
      sha256 '7c6a393f35e2f165ca104f95202d4a08a786227439a70bea41f97b2d563817fa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.5.0/deck_v0.5.0_linux_arm64.tar.gz'
      sha256 '03fdfb4ac0a408a0e4959391fd3fca683f006eafb19f095c45415a1c3bd2e8f2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.5.0/deck_v0.5.0_linux_amd64.tar.gz'
      sha256 '5d2613e2393cabe40d80bb25cbf2ee892fdf17c34a3eb8e405e0c1b73b41821b'
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
