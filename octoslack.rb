class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.5.1'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.5.1/octoslack_v0.5.1_darwin_arm64.zip'
      sha256 '9bfc3190eab5daed97504537a2ee3c68020cea9eae4405d8579c7126088af4b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.5.1/octoslack_v0.5.1_darwin_amd64.zip'
      sha256 'b7a463e3edcdc0219ce272aa6d5c7ba8f7d6d742d2cd8ec387524c6b3ee4759b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.5.1/octoslack_v0.5.1_linux_amd64.tar.gz'
      sha256 '1d70fe4c9558bcb08dd30d2a962468e008ca4e6290598e488274e95b5ee7d658'
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
