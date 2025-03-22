class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.10.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.1/gh-setup_v1.10.1_darwin_arm64.zip'
      sha256 '7a6ac7ce5dfc9c262cc1f46f369580cba121e5fb926c8d2801838c2821323ec5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.1/gh-setup_v1.10.1_darwin_amd64.zip'
      sha256 '1093e36f8978dbd0d1e34e2c012eb5fceb8e8fe07d2c45eb0aed53df231ae017'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.1/gh-setup_v1.10.1_linux_amd64.tar.gz'
      sha256 '5c5bfa4631409c01f705b3946793ebb6dc8256c179c21140614ea8be6c2f63de'
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
