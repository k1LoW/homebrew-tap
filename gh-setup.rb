class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.8.3'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.3/gh-setup_v1.8.3_darwin_arm64.zip'
      sha256 'c847d7d2ee7634939e1d6e666813ff390573ea813e50758088ecf11155c3625b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.3/gh-setup_v1.8.3_darwin_amd64.zip'
      sha256 '9dfc1eb0540bc4da7fcc97e54cbe4ee41fff89c37d127e92208203d886e94c93'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.3/gh-setup_v1.8.3_linux_amd64.tar.gz'
      sha256 '83033ee211ac5b926efb75d51b5fb0d82411164510685efca4c97390432eac7e'
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
