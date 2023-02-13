class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.7.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.1/gh-setup_v0.7.1_darwin_arm64.zip'
      sha256 '0d2fbe37fe470877cfe8a9c7e6cb34fe50739d1b887053bb8a6ccf5c09d194f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.1/gh-setup_v0.7.1_darwin_amd64.zip'
      sha256 '54d310fcaebbe0dabf8f0f0a3882c2d00cbe1404854a8c234925d82546f833bd'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.1/gh-setup_v0.7.1_linux_amd64.tar.gz'
      sha256 '24f5134e08a5a3253d98797e0d70b5a3ee432e6d0fd470cc9dca477a507dcb14'
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
