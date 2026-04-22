class TailorUm < Formula
  version '0.1.0'
  homepage 'https://github.com/k1LoW/tailor-um'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.1.0/tailor-um_v0.1.0_darwin_arm64.zip'
      sha256 'a59aa89d8c34aadd883d68a81a14e3c4488e4fc5b38b256946b3e32b3b81f4a4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.1.0/tailor-um_v0.1.0_darwin_amd64.zip'
      sha256 '5be0461bf62400d1b40084f3c5a7001baba73a947e64f4fe98f1fff8b20828ff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.1.0/tailor-um_v0.1.0_linux_arm64.tar.gz'
      sha256 '7f8cc40b8206b561b32dd333aba1a3fbaa1a96180d060e20addeeb2f2b7d1625'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.1.0/tailor-um_v0.1.0_linux_amd64.tar.gz'
      sha256 'a3017f322c574f9b4a606b12f3446bed62c0409eb3485e6287ff4e804daabb80'
    end
  end

  head do
    url 'https://github.com/k1LoW/tailor-um.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tailor-um'
  end
end
