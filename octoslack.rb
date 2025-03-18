class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.0/octoslack_v0.13.0_darwin_arm64.zip'
      sha256 'be731da962a4c92676b8de1b9564ee9b2fa3fe829bcac8b935d97c8e9a4c260f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.0/octoslack_v0.13.0_darwin_amd64.zip'
      sha256 '4207c8040d5771d2cb4a8184ac646f0d86b94f6fc47c21211a65ae3012c367b3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.0/octoslack_v0.13.0_linux_amd64.tar.gz'
      sha256 'fe7e9d92baa6fe98d7069b7d5da1f218b806be01d53b16129c139729d6825e84'
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
