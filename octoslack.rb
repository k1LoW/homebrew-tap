class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.8.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.8.0/octoslack_v0.8.0_darwin_arm64.zip'
      sha256 '4fb01a4ba88e778b092288004929d109bf95160c0063e1d0b62b7276701e2f0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.8.0/octoslack_v0.8.0_darwin_amd64.zip'
      sha256 'c83396219134a7a52ab03ccd0158bec4a6adc464050ec94396fa0fd99d338c54'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.8.0/octoslack_v0.8.0_linux_amd64.tar.gz'
      sha256 '75f79a1bfd7199c07d3b0a2bff0ea80f24d93d71c6e480b65f6d302cc6d91394'
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
