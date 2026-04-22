class TailorUm < Formula
  version '0.2.0'
  homepage 'https://github.com/k1LoW/tailor-um'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.0/tailor-um_v0.2.0_darwin_arm64.zip'
      sha256 'b7cecb288766bb177a24eb38d8b317ab97cfe9579809e4a04d70aecff026d7e0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.0/tailor-um_v0.2.0_darwin_amd64.zip'
      sha256 '1a60328cf81fbb809466b93c86d5963b508399721df974d33468b43a72eddadf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.0/tailor-um_v0.2.0_linux_arm64.tar.gz'
      sha256 '70d352166f96d60dd1af22e8e79225f0ea692d53c4c2485c5acff37c93efbd7d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.0/tailor-um_v0.2.0_linux_amd64.tar.gz'
      sha256 '97ca5971640e655b26d58e1ad76021f4aeb94f36a85d5a5ca431c79c835195f6'
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
