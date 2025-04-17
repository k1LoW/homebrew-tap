class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.0/gh-setup_v1.11.0_darwin_arm64.zip'
      sha256 'af0f1086cdb0294906a7e4de8452845f1f585dea4902193ae85f3e0d4d9d25f2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.0/gh-setup_v1.11.0_darwin_amd64.zip'
      sha256 'ab07bce2cf2a03d1c13c561850e186abf5c4957ad212fb0929565ee898a425da'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.0/gh-setup_v1.11.0_linux_amd64.tar.gz'
      sha256 '12ad1abba36994d39b4f7d992b396a5ceaadae72bf156b2f93206cecbf3ae85e'
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
