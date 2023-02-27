class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.2.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.0/gh-setup_v1.2.0_darwin_arm64.zip'
      sha256 'd9e429d7afd28442b0cf8f3a5cfe80da76de64757b60374fbd47132722c07115'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.0/gh-setup_v1.2.0_darwin_amd64.zip'
      sha256 'b79c31edd261754c0ef4b14ecbc955358bd0243f6cf2cff14da023992e07bf1b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.0/gh-setup_v1.2.0_linux_amd64.tar.gz'
      sha256 '27da9ad46479726e206bc56aa384115930b30f439fe0428b6d6e16a94771d611'
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
