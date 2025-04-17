class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.2.5'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.5/tbls-driver-tailordb_v0.2.5_darwin_arm64.zip'
      sha256 '083de69758a5348d1677ebd991165e041f66aac3a35dfe36c9c074aa84d43575'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.5/tbls-driver-tailordb_v0.2.5_darwin_amd64.zip'
      sha256 'eae88762908b524fabcd9b258033b2009b34bbe52164efa205282dd3a9f5c4d0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.5/tbls-driver-tailordb_v0.2.5_linux_arm64.tar.gz'
      sha256 'bebc63ff021b55f260ed0ffb6c39c5d682f5d4e44255a1105c610d8ff85a411a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.5/tbls-driver-tailordb_v0.2.5_linux_amd64.tar.gz'
      sha256 '16e978d8a22bf7f50f75f8632ccbbe5a04738d77a02c30ba1d4c283bc1942d39'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-driver-tailordb.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-driver-tailordb'
  end
end
