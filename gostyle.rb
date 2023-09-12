class Gostyle < Formula
  version '0.4.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.4.0/gostyle_v0.4.0_darwin_arm64.zip'
      sha256 'ef06dd284b6ae018d0c4b41f1a84a46ab9647b046567256a0db1d53c06d1c680'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.4.0/gostyle_v0.4.0_darwin_amd64.zip'
      sha256 '29f74f545de6aab54f72c3ebbb287dd1bacd9a6b9f6205032ada6264325e55fe'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.4.0/gostyle_v0.4.0_linux_arm64.tar.gz'
      sha256 '14c857ae8e88338f81388670bd8be3b997b2aa8390f0a50b98ace33883d47f8a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.4.0/gostyle_v0.4.0_linux_amd64.tar.gz'
      sha256 '0f664d4fe9060a7829a632dae60d8d95a96cd7ebd4060b394d5c2ab94b36f43e'
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
