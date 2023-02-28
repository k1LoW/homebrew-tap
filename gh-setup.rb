class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.2.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.1/gh-setup_v1.2.1_darwin_arm64.zip'
      sha256 '8a8d23efd90c2749f65573332477888de484d17a5af103d0dc06c6a84f20731c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.1/gh-setup_v1.2.1_darwin_amd64.zip'
      sha256 '1e3855cae34221359bbc26826800c6beb0d3734c3d152ef32d91545a34a347a7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.1/gh-setup_v1.2.1_linux_amd64.tar.gz'
      sha256 '39678a9d0bc961bca6cc8c19aa285ba42f74a6636748c98e9da152a7e40d4aec'
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
