class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.1.0/tbls-driver-tailordb_v0.1.0_darwin_arm64.zip'
      sha256 'c05a426be413c6115d718ac0d5d540d37601e75cda1fb49b559706c83feb853a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.1.0/tbls-driver-tailordb_v0.1.0_darwin_amd64.zip'
      sha256 'e90810082c60292f13e0bcece7f6ef3881370a0c8249c75ce0155a7e86b1dcd6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.1.0/tbls-driver-tailordb_v0.1.0_linux_arm64.tar.gz'
      sha256 '124afa30bde0709aac4899d1f68dbb4eb7716a81f857722833225b0d6ab3edee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.1.0/tbls-driver-tailordb_v0.1.0_linux_amd64.tar.gz'
      sha256 'c7399ab77f72b8c43829fdaf04339d48a0487e15100ef83f6b6b8ef8de2a5e1b'
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
