class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.6'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.6/octoslack_v0.13.6_darwin_arm64.zip'
      sha256 '1972ee8878713d13c69c8bee00caae8c6fbd32e0872c1378790be3b8dcb6c7ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.6/octoslack_v0.13.6_darwin_amd64.zip'
      sha256 '11b7cc65abe90b9330f5cef7183bd93f429f7fd35f84f2df1ea243ac88b4df5f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.6/octoslack_v0.13.6_linux_amd64.tar.gz'
      sha256 '9e7a75c9b4c83f0cabc3acb109fa70a7748e706abbbcd286483c6501cdd2f22f'
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
