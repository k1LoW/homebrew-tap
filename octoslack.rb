class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.1'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.1/octoslack_v0.13.1_darwin_arm64.zip'
      sha256 'c9fd2caab3e001ab7ee67426a4d20310d59a62c6d6552987f686a90ae3674a35'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.1/octoslack_v0.13.1_darwin_amd64.zip'
      sha256 '22fb2d82c596a2702039b574926f262ac130f446c0799a16fe233da92aea1af2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.1/octoslack_v0.13.1_linux_amd64.tar.gz'
      sha256 '222e09c72870da14344a7baf99ab3cd90c98725a282c341ce797a4edc3fc21a6'
    end
  end

  head do
    url 'https://github.com/k1LoW/octoslack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octoslack'
  end
end
