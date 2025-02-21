class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.0/tbls-driver-tailordb_v0.2.0_darwin_arm64.zip'
      sha256 'f37eba308352e41b5fc963988399789d47a7e2ba27e2ba5bef079315fb72731b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.0/tbls-driver-tailordb_v0.2.0_darwin_amd64.zip'
      sha256 'a9af6a9bb61749b589fff381e8eb723c746996f48f05fdbcb29ad3fec4d95e4a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.0/tbls-driver-tailordb_v0.2.0_linux_arm64.tar.gz'
      sha256 'd5a4c50499983ba4a4e7931199314aec4bf1bb435c2f92c3bbe7b65c849066b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.0/tbls-driver-tailordb_v0.2.0_linux_amd64.tar.gz'
      sha256 '36c5f468885a7bd0487fa684ea6d79a6be6438c017e7db2a40455c9d88fae80d'
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
