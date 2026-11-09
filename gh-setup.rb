class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.12.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.12.0/gh-setup_v1.12.0_darwin_arm64.zip'
      sha256 'a07ad4fc7b0c35d034a2535494d4fb0f3f6103b3db95d7e3218c2332f844ffe8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.12.0/gh-setup_v1.12.0_darwin_amd64.zip'
      sha256 'd5500c5c8b841a465fdb2cd7e305c4556616922615293149832f3b80abaadfb5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.12.0/gh-setup_v1.12.0_linux_amd64.tar.gz'
      sha256 'e7473f740e2fb3359f0cfde6a17045e824ca6b6d5ee33e0726362e52f84e73ee'
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
