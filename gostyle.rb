class Gostyle < Formula
  version '0.13.3'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.3/gostyle_v0.13.3_darwin_arm64.zip'
      sha256 '5c2ec20eaf8cff1ec3364d65f3a8da6785ede88ded626e3326415b9c3f93d3c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.3/gostyle_v0.13.3_darwin_amd64.zip'
      sha256 'e36babcd3e638cba2067bf209a8a761d91a22d4a42c6900300740343caa85bc0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.3/gostyle_v0.13.3_linux_arm64.tar.gz'
      sha256 '4b9b6136e3321c202ae4af95a3e669bb89fa7d0214ba02354cafa2795cd64434'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.13.3/gostyle_v0.13.3_linux_amd64.tar.gz'
      sha256 '26b712320eba428685ec621337749fbf88ae43d0e41bce715cc0c2aa2c1b38f1'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
