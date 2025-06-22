class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.24.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.0/deck_v0.24.0_darwin_arm64.zip'
      sha256 '8f32d92f4906cf4f93b142df1ccd42743861c68c75103a24bf18d2dbd789bb1e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.0/deck_v0.24.0_darwin_amd64.zip'
      sha256 'a769d1eec08da52f7cb107f08d97b64aeb2ecf846a858f76e9c5e6a3ca21c64c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.0/deck_v0.24.0_linux_arm64.tar.gz'
      sha256 '1cc3b890fe790943fd246f613321f01e5b0ff9dcc714a5fe25704b5909b3e30c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.0/deck_v0.24.0_linux_amd64.tar.gz'
      sha256 '4a6e6dd479626c924e25d01d4c77269be9ad50a66a4ad2f45e22aab04289ed52'
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
