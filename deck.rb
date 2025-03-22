class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.11.3'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.3/deck_v0.11.3_darwin_arm64.zip'
      sha256 '1963568b1332364119ec033b11c8d697ecbf95dd17fe8c806fce3fd67204f8b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.3/deck_v0.11.3_darwin_amd64.zip'
      sha256 '499dfdba0964dfd46b50e4e2ceabcd9e60191aae099ef753ec75fbd0f654e058'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.3/deck_v0.11.3_linux_arm64.tar.gz'
      sha256 'ddd244830cf56aaa524efff750fa399aacd8f4cb8ba93992ac6d9712d5d7ebfe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.3/deck_v0.11.3_linux_amd64.tar.gz'
      sha256 '5d7ed0c1d5c93f3a1363c12964a4fc745a0d440e1523551fa474c23fb86b2243'
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
