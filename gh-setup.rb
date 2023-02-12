class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.2.0/gh-setup_v0.2.0_darwin_arm64.zip'
      sha256 '0dfd225eb0fed8377246267d467c7a3a1595d2cd4b9ed8b769d5543da3af8841'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.2.0/gh-setup_v0.2.0_darwin_amd64.zip'
      sha256 'b3dcd01e7abd5fd7eb92e7cd4b157faa822b42595dbc74abc68a03910f52fea9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.2.0/gh-setup_v0.2.0_linux_amd64.tar.gz'
      sha256 'b32ccf7a15e3ba649b8b474f8d5e1be610fa37ac3c29c9b71e861f5323b86f76'
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
