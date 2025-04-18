class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.2'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.2/octoslack_v0.13.2_darwin_arm64.zip'
      sha256 '0d99e9e6daf3b29604a624e29aee9af6f522167e6d1797f00ae773ee4c9d137b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.2/octoslack_v0.13.2_darwin_amd64.zip'
      sha256 'fd7c2b20e4270e6bcd9719f9a10a2cb822ad0fe5ae0ca96136981fef34896986'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.2/octoslack_v0.13.2_linux_amd64.tar.gz'
      sha256 'effeeccfb242d839477bafc16212f24abeee518348e5d2453ed0db604f3fea26'
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
