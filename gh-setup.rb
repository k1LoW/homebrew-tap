class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.6'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.6/gh-setup_v1.11.6_darwin_arm64.zip'
      sha256 '1bcfa6d4823df62c8b0884ccbe580e0f3a945d727a8f294697046e438cf0b95b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.6/gh-setup_v1.11.6_darwin_amd64.zip'
      sha256 '576a2ccc47d172fbad7a0f99f2a07734cf5b2be071b0771c8e1d117c08e2e1b1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.6/gh-setup_v1.11.6_linux_amd64.tar.gz'
      sha256 'f35133769e9c4da5c557a3fad83f44b7d8b7297a45c5884f64a48d5b6cf32df4'
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
