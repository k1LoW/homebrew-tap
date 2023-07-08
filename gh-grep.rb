class GhGrep < Formula
  desc ':octocat: Print lines matching a pattern in repositories using GitHub API'
  version '1.2.0'
  homepage 'https://github.com/k1LoW/gh-grep'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.0/gh-grep_v1.2.0_darwin_arm64.zip'
      sha256 '0d4ed6c8a6dc01ee9afea1fe2fb787ffba460fc046c9d934bb1963b9c6cb2c7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.0/gh-grep_v1.2.0_darwin_amd64.zip'
      sha256 '1156a217d1e22cf0ae551a91cca31fa72ee4563510f50b5036c98d89d1d01bbc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.0/gh-grep_v1.2.0_linux_arm64.tar.gz'
      sha256 '0e543a1beef0780b74fa50b0005b4b40aa38780d87b59cc4ff9c69f61d663080'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.0/gh-grep_v1.2.0_linux_amd64.tar.gz'
      sha256 'a32bfdae130b0ebb1bafd96d5d039f8ee50c9c10736990ce7b854c5ec6610bd3'
    end
  end

  head do
    url 'https://github.com/k1LoW/gh-grep.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-grep'
  end
end
