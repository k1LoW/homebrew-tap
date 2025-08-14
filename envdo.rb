class Envdo < Formula
  version '0.2.0'
  homepage 'https://github.com/k1LoW/envdo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.0/envdo_v0.2.0_darwin_arm64.zip'
      sha256 'f96e7998b0c2e69a702c9df4d669a31121c49d76a1e64554ae709ee45f42f988'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.0/envdo_v0.2.0_darwin_amd64.zip'
      sha256 '78a6d444454bbef55e05881b58d475f33ae2e3b5da7906e29a03f89869a1f9d5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.0/envdo_v0.2.0_linux_arm64.tar.gz'
      sha256 'd9402c11060a10a9a802101510dc05ad5b380cf53d1a614e1eba96438cd0e138'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.0/envdo_v0.2.0_linux_amd64.tar.gz'
      sha256 '69b82b73f918972a881b29f2ca4232909197a32d950c37c2a1dc3a57c4f07258'
    end
  end

  head do
    url 'https://github.com/k1LoW/envdo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'envdo'
  end
end
