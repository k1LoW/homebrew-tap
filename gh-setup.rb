class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.8.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.0/gh-setup_v1.8.0_darwin_arm64.zip'
      sha256 '235a2aca4153ff992215fb779f3f7870987dfe33ecb920f82e4f219b3f1b0088'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.0/gh-setup_v1.8.0_darwin_amd64.zip'
      sha256 '317ea3f0dbbe1af5adb72c696d7c8c90e691e2656b979bc3bed25325c34ead51'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.0/gh-setup_v1.8.0_linux_amd64.tar.gz'
      sha256 '175ae33d559cca8cf341d91e3eb10a07d0029e8a7cab344ef05df186d743b58b'
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
