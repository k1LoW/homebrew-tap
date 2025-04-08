class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.2.4'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.4/tbls-driver-tailordb_v0.2.4_darwin_arm64.zip'
      sha256 'ea96f3521fb717a0d5b8606922749c3c9e6b673f0bc2f2dd3d6dd9c9446eb307'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.4/tbls-driver-tailordb_v0.2.4_darwin_amd64.zip'
      sha256 'abc7c84958ea8999c711de4b7c823f821cc3c9cd1bb649136b8dd19e5a7d990f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.4/tbls-driver-tailordb_v0.2.4_linux_arm64.tar.gz'
      sha256 'a8abe55908c94be8dd62025deff82cbf84983ffeec9b6052e50f9ab934c3f6a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.4/tbls-driver-tailordb_v0.2.4_linux_amd64.tar.gz'
      sha256 '9ae07065a8efe704111892aeddcb444927d2ec80e84eb5bd3d1ea3219ab85dee'
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
