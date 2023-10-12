class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.8.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.1/gh-setup_v1.8.1_darwin_arm64.zip'
      sha256 '9ef926ba49178110a5bf04e9feb9e69df9a8bf5a1915f63e9d282c2d1a97b24c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.1/gh-setup_v1.8.1_darwin_amd64.zip'
      sha256 '22b406898a572cab6bac898441c02fadf880b9203c7cccd69e5fb8d10c419c00'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.1/gh-setup_v1.8.1_linux_amd64.tar.gz'
      sha256 '35229cd5719fc08310c1162d3d866b3de18fd7de47d09a2f4f2ed799de7ca93d'
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
