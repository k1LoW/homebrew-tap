class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.9.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.1/gh-setup_v1.9.1_darwin_arm64.zip'
      sha256 '51fc767618045694710875809a2e0dc58660275b0af2972f0f4799721caba226'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.1/gh-setup_v1.9.1_darwin_amd64.zip'
      sha256 '1f8f21fc87526c90626568233c0bb570989c1e0faf176c3d8c781eef6bcb777c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.1/gh-setup_v1.9.1_linux_amd64.tar.gz'
      sha256 '44f05824aa56a17e6e14c5072a5608f19cc88500b14fb8fe74d3b07f53ba7219'
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
