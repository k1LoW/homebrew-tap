class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.1/tbls-driver-tailordb_v0.3.1_darwin_arm64.zip'
      sha256 'fc6b28448c15eabbc805d303c9c36b0184f4f6d9fdc2f00ecc1157f1e5989139'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.1/tbls-driver-tailordb_v0.3.1_darwin_amd64.zip'
      sha256 '1c63c0c016e1c29cb0c153fa95742f54348189b723133b69ddff85c8a87d4a7d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.1/tbls-driver-tailordb_v0.3.1_linux_arm64.tar.gz'
      sha256 '4739b1c1020bfe3c1f917ba8d837f9bca07370b33fcb8b1bde003ffb773ef246'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.1/tbls-driver-tailordb_v0.3.1_linux_amd64.tar.gz'
      sha256 'b07c56c6f878ee91a63a04d5c6bb7145d3d6c6b90429c5933c79f10ddcf56b3f'
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
