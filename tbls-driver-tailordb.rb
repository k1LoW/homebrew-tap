class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.0/tbls-driver-tailordb_v0.3.0_darwin_arm64.zip'
      sha256 '02611e6aea4ddf625cddb00c84c99c8941f50c22c7a36220aad25ea396a8a1ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.0/tbls-driver-tailordb_v0.3.0_darwin_amd64.zip'
      sha256 '38b6948675317b4da683aae4b86d799e5839117c286d25be047f5aeb54a927a9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.0/tbls-driver-tailordb_v0.3.0_linux_arm64.tar.gz'
      sha256 '827595a5f02c42a8fe68a5f3f2fb1b39cde4c754d5fa77790f1948806892c7d2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.0/tbls-driver-tailordb_v0.3.0_linux_amd64.tar.gz'
      sha256 'f0e0a72e51aedc57d6273bd4ee593df3ee9f645024101d62a85e73ab52e561b4'
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
