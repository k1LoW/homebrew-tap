class Roots < Formula
  version '0.1.2'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.2/roots_v0.1.2_darwin_arm64.zip'
      sha256 'f0728b7ffc245cdc1d34362896be761d112d1f741ae7840625d83b4b7b797ddf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.2/roots_v0.1.2_darwin_amd64.zip'
      sha256 'f04de5ae50cb53d021c2e26f3f22d183a9191d50a04c6438c26127d8873d7d3d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.2/roots_v0.1.2_linux_arm64.tar.gz'
      sha256 '1d61e3c1f460b3e976a33833b50ad8e94ca6b38b68ae0f53084137cd799d209a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.2/roots_v0.1.2_linux_amd64.tar.gz'
      sha256 'dcf7940e5aa4428de8eb07e02269a5c83fc7c0215a5c5bf18b8b4cdbbc80d38f'
    end
  end

  head do
    url 'https://github.com/k1LoW/roots.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'roots'
  end
end
