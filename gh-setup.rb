class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.8.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.8.1/gh-setup_v0.8.1_darwin_arm64.zip'
      sha256 '872702174fa89c51155548497d81806ba6ec810d04ebbd8bd6d390683fc1672b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.8.1/gh-setup_v0.8.1_darwin_amd64.zip'
      sha256 '8be55cd5bc0ca3712d1a268022a06fdb0d11e36ec51b7ed6a4ca6bc6c6ea2209'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.8.1/gh-setup_v0.8.1_linux_amd64.tar.gz'
      sha256 '093d886187d639a1c61ebdb26f84e7f04ae040c234a0000cc77bdae39e77b595'
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
