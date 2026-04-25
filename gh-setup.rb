class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.8'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.8/gh-setup_v1.11.8_darwin_arm64.zip'
      sha256 '3e8b9c69467397707c3dc01c68f7f221f087860619b97c3b44f6c1047a2d65c6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.8/gh-setup_v1.11.8_darwin_amd64.zip'
      sha256 'e0bfd77dfd148c66e03916c46891bb7157b1f2846c5b2c7b5638e6dd6a551242'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.8/gh-setup_v1.11.8_linux_amd64.tar.gz'
      sha256 '33aea6b745ae1efa72dfb46f4c3e821b55c589393fb3c13929061bdc1cba3e3b'
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
