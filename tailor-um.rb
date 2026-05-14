class TailorUm < Formula
  version '0.2.2'
  homepage 'https://github.com/k1LoW/tailor-um'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.2/tailor-um_v0.2.2_darwin_arm64.zip'
      sha256 '53b16b8d60916daa97e051abd537d0445eb84072889a08abff09a3a774559d88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.2/tailor-um_v0.2.2_darwin_amd64.zip'
      sha256 'b3ffb8945132eb522991831377b8531005058af81382dd21f8cd52b8dc3b93ca'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.2/tailor-um_v0.2.2_linux_arm64.tar.gz'
      sha256 '79cc45db2ef867e5fc56ad11b508c2941ae6f47e4f60f026040a762c1589529f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.2/tailor-um_v0.2.2_linux_amd64.tar.gz'
      sha256 '089cc75d6500eb754da61e09bb7a2e84ffd5d3d9e5785c94c0e4db2caff406a1'
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
