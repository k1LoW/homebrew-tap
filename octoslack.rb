class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.3'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.3/octoslack_v0.13.3_darwin_arm64.zip'
      sha256 'f24774b3392bbd4744292fe92abf93cf79a21f8e2d125cb7fe17e56e1b9b5aab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.3/octoslack_v0.13.3_darwin_amd64.zip'
      sha256 '16606c4193740a81d866d11f7977cb8c9c28c4404318e3d49ec31498f1cbcf67'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.3/octoslack_v0.13.3_linux_amd64.tar.gz'
      sha256 'a9850ae14f87eb75ec587deb169cdc4e7e66ce8cf822d950f86e517874043bcb'
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
