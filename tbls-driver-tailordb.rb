class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.3.2'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.2/tbls-driver-tailordb_v0.3.2_darwin_arm64.zip'
      sha256 '97c0a284f25ab94632592123b0d67d9e69751e6867bc555a2d1549a33d482b59'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.2/tbls-driver-tailordb_v0.3.2_darwin_amd64.zip'
      sha256 '9e33dfe9ab007657456fa32a0ac904d6451b94fd0d97eaaa91ed091f1c18fa7e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.2/tbls-driver-tailordb_v0.3.2_linux_arm64.tar.gz'
      sha256 '9f33743838abb3c96bb41f906c4286c1eb301448f0519f2c360a832496dc7879'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.3.2/tbls-driver-tailordb_v0.3.2_linux_amd64.tar.gz'
      sha256 'f48669ffcd53edc81a3374c0d000e8c30f46876cdffcf953f81484fef0a87a65'
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
