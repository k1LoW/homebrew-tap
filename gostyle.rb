class Gostyle < Formula
  version '0.10.6'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.6/gostyle_v0.10.6_darwin_arm64.zip'
      sha256 'fc6bbe3a0eabd984c6bb3fc382d4fcaeb71a428e456cb5e29280359b1329c9e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.6/gostyle_v0.10.6_darwin_amd64.zip'
      sha256 '160631e209e2b95b8dedf1437371411f33f7add415b170bcccb3ce0556872824'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.6/gostyle_v0.10.6_linux_arm64.tar.gz'
      sha256 'a573acbe6a4a6971edffe89a50b72d9b8d8774da48d71af50fd52cba3025f73a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.6/gostyle_v0.10.6_linux_amd64.tar.gz'
      sha256 '05269ad508e891d6af9fdc40e1a2f44edd447d4fbc54b0ca4b75ce91d7e603be'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
