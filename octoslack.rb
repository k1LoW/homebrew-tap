class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.9.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.9.0/octoslack_v0.9.0_darwin_arm64.zip'
      sha256 '3dd9aac79ca48dacf4b7de23d85efdd409dd1ffcb3b3e9baccd6d40ba7b61e75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.9.0/octoslack_v0.9.0_darwin_amd64.zip'
      sha256 '498cbc29703be82c3702c1426e37d22995534b44601703cadfff924d8a0870df'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.9.0/octoslack_v0.9.0_linux_amd64.tar.gz'
      sha256 '66547caf101ab573e62f66c3e024af2296104a24d2a49d971c1026c9743573ec'
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
