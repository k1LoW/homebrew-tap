class Roots < Formula
  version '0.4.2'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.2/roots_v0.4.2_darwin_arm64.zip'
      sha256 '4c80be4911a4f73557537bac3a6bf4c4124df0637ca08801d65bc25db80f189b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.2/roots_v0.4.2_darwin_amd64.zip'
      sha256 'e8a5c26afc8de0f7aad26f3410a45f6c06c0dd820843b79b78a93292ffe2144b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.2/roots_v0.4.2_linux_arm64.tar.gz'
      sha256 '7ab4502e36e0c94ded711a9c0ee44c9b52e8db93be9f1f8e8cdfea5bbbb74e24'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.4.2/roots_v0.4.2_linux_amd64.tar.gz'
      sha256 '80191e25b20c4577c2ef591a9a51f5a2a9761b66a277f2915f6da454cde26dff'
    end
  end

  head do
    url 'https://github.com/k1LoW/roots.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'roots'
  end
end
