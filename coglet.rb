class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.1.2'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.2/coglet_v0.1.2_darwin_arm64.zip'
      sha256 '2379046f0c4417a4b73b80ed8e22cd89b3911b8d32c9982672fdf105cec175fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.2/coglet_v0.1.2_darwin_amd64.zip'
      sha256 'aebf1ae2626d9112c685d48beaee0cf239bf74e111f4854bbba9624c03908758'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.2/coglet_v0.1.2_linux_arm64.tar.gz'
      sha256 '077488de12a9a8af271fa4da84138c4075ba48d8a4dccd5ca09b0a0eed072b5a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.2/coglet_v0.1.2_linux_amd64.tar.gz'
      sha256 '273485c688a3822a68fb3cf01f22023c879c000c64859af2d6fa2d71b1bc4ea0'
    end
  end

  head do
    url 'https://github.com/k1LoW/coglet.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'coglet'
  end
end
