class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.5.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.5.1/gh-setup_v1.5.1_darwin_arm64.zip'
      sha256 '5430ed912842664f5bce998fa504677ea686b6db41c4e6d588aa437851ed281f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.5.1/gh-setup_v1.5.1_darwin_amd64.zip'
      sha256 'd194a20f18d584eef3691970de2ae88c76653fec2b4a9b64b811a1ae11619e7c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.5.1/gh-setup_v1.5.1_linux_amd64.tar.gz'
      sha256 '7e623c3116ab970ebbb1546affb113bca30e5db7aa4c6b743351d7a85d870875'
    end
  end

  head do
    url 'https://github.com/k1LoW/gh-setup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-setup'
  end
end
