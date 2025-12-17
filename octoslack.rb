class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.5'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.5/octoslack_v0.13.5_darwin_arm64.zip'
      sha256 'c8d6687ca7abe7638e53970c9161b2b052ad8e4b061fdf5b54a4344136116934'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.5/octoslack_v0.13.5_darwin_amd64.zip'
      sha256 '3978ffec5b18de3922d5a4d98dab72263cb0ff362be89409f9bae39a9f0d426f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.5/octoslack_v0.13.5_linux_amd64.tar.gz'
      sha256 '35b6cb4dcb65d58a1c1192bc5e4ff129e066259a0fbb4cf5689ff7834bf71fa7'
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
