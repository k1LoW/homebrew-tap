class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.2.2'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.2/tbls-driver-tailordb_v0.2.2_darwin_arm64.zip'
      sha256 'adf361403867ba4dd6acecb3029e72fabbd5fc017f8c49f3f604ac0c9ed93bef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.2/tbls-driver-tailordb_v0.2.2_darwin_amd64.zip'
      sha256 '25b0cbcac53df61aa394c007e09bc43f13a8f8de525ac05949a0d53ed5fbf510'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.2/tbls-driver-tailordb_v0.2.2_linux_arm64.tar.gz'
      sha256 '63e17fc69f998e3edd9dcb74c0bb66fbf82b9aee2641cec6ed35b3de76f9051d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.2/tbls-driver-tailordb_v0.2.2_linux_amd64.tar.gz'
      sha256 'e4b69a57a575774d7f655ce1e65aa5cbf374b37a3bfea2e2a6b343d120be080b'
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
