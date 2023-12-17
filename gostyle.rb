class Gostyle < Formula
  version '0.18.4'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.4/gostyle_v0.18.4_darwin_arm64.zip'
      sha256 '4a7b3e2193f65b93ae57bb8552d061e2eb91d423d69e3f8172b36d31d2e9263d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.4/gostyle_v0.18.4_darwin_amd64.zip'
      sha256 '9811e53694841398835fc6b9b5d73a816113ac82d4e12687d5ded076ef44c44f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.4/gostyle_v0.18.4_linux_arm64.tar.gz'
      sha256 'df21223d7d4d29580a3bc07a323aa4a16f15302728e33885675190617879acf6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.4/gostyle_v0.18.4_linux_amd64.tar.gz'
      sha256 '4a02f8bb6186e27acd0178bd78de41acf76cb537643df3019fd0be0ead8796de'
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
