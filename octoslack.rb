class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.12.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.12.0/octoslack_v0.12.0_darwin_arm64.zip'
      sha256 '143ca87c25ffa0e7f5df5717d2aec4f011cf59dcbe77c49991dcfcacefb4a483'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.12.0/octoslack_v0.12.0_darwin_amd64.zip'
      sha256 'aecfeba750e88093a460c1082768426812efa6a66afdb0177abd7be6cc249046'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.12.0/octoslack_v0.12.0_linux_amd64.tar.gz'
      sha256 '0dde63b20f6fc97cfa630442ca9b8a55e083bc027947d985231b102766af2ef8'
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
