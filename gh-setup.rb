class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.6.0/gh-setup_v0.6.0_darwin_arm64.zip'
      sha256 '4add3bec65e49391bc2a1f030b3f9ae3041113ea0d77903a649cd16227be8359'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.6.0/gh-setup_v0.6.0_darwin_amd64.zip'
      sha256 'ba242bd7c23c90f214f276abddb580e8c45c04c594576a1b3d9f3729d409e6f1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.6.0/gh-setup_v0.6.0_linux_amd64.tar.gz'
      sha256 '0e392fed26d011004cf06aa8973543f7f45ecfd87585b3698514b2c067bc6252'
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
