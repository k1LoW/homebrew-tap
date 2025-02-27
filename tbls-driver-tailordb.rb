class TblsDriverTailordb < Formula
  desc 'tbls driver for TailorDB schema definition'
  version '0.2.3'
  homepage 'https://github.com/k1LoW/tbls-driver-tailordb'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.3/tbls-driver-tailordb_v0.2.3_darwin_arm64.zip'
      sha256 '39b2a746dc25ab8d5be0d779e51e3172c9426a94ce42463689304c041243f6f5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.3/tbls-driver-tailordb_v0.2.3_darwin_amd64.zip'
      sha256 '1fcf917cd224ce8cf83b3d864a77474f0c3ab67103c11aef1d0c43bd13c6b15d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.3/tbls-driver-tailordb_v0.2.3_linux_arm64.tar.gz'
      sha256 'ff920daf71c93a57698487d04e51eb56b954841962ba281e8a3f7e9663332285'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-driver-tailordb/releases/download/v0.2.3/tbls-driver-tailordb_v0.2.3_linux_amd64.tar.gz'
      sha256 '81f0c9f0b0a21f9d5218a5fa147f72e5546df4b3a9b8a398e7b6ae250da0f988'
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
