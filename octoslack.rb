class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.6.2'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.6.2/octoslack_v0.6.2_darwin_arm64.zip'
      sha256 '8280056806c1ef81a1860a6e189d085d4e8d4470eed452f9ffd1ce3dd88412ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.6.2/octoslack_v0.6.2_darwin_amd64.zip'
      sha256 '220874a5837e0b91002cf56d7ab18603b55d2c5f8d71c3586a3751ce589c6b90'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.6.2/octoslack_v0.6.2_linux_amd64.tar.gz'
      sha256 '7b15008b72f835fae238d32a0eeca3a1e31f40bb4c41b3fc14c8c461f0df9cd4'
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
