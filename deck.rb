class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.22.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.0/deck_v0.22.0_darwin_arm64.zip'
      sha256 '621fe20c9602edccd3f2460ff62f2f45adbc94d44b895291d9f800a414e85fcd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.0/deck_v0.22.0_darwin_amd64.zip'
      sha256 'c11d34c1e69a8bcacd67e8e8b8881e66847e4d4b3e506ffe7107097956ebc593'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.0/deck_v0.22.0_linux_arm64.tar.gz'
      sha256 '54de963a73945b2cb8cefccc01de0119d8bd408e8cdf329a52d6092b72f3a382'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.0/deck_v0.22.0_linux_amd64.tar.gz'
      sha256 '6b9173bcc845406196d0036b7ff340653480bf72f72c513f289e3d7c4fe4dab9'
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
