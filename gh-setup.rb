class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.0.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.0.1/gh-setup_v1.0.1_darwin_arm64.zip'
      sha256 'd654a86e5196ca766e963ea2e6a0fc14fe1009958f11485879fd0248418ee446'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.0.1/gh-setup_v1.0.1_darwin_amd64.zip'
      sha256 '0af24f0ad0f81d0d112549758632b66cbad0f0ace479674c5f40e80477b8c60e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.0.1/gh-setup_v1.0.1_linux_amd64.tar.gz'
      sha256 'c64d599bc17bb7589b17590f9b72b35486cbfbb5936124fcd059b3963e7ebb20'
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
