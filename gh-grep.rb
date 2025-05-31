class GhGrep < Formula
  desc ':octocat: Print lines matching a pattern in repositories using GitHub API'
  version '1.2.5'
  homepage 'https://github.com/k1LoW/gh-grep'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.5/gh-grep_v1.2.5_darwin_arm64.zip'
      sha256 '2a1870aa05e8364e1aad3304829ff2507bd90f773b54c3638a67a83249f3a1ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.5/gh-grep_v1.2.5_darwin_amd64.zip'
      sha256 'aa7d513b56971cdb44080e853bf94c3d9dcb68be29cdfab8da5f160abf780591'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.5/gh-grep_v1.2.5_linux_arm64.tar.gz'
      sha256 '064fb6fbcff88bc9ec7700c7ae8cbb8a45ff57f26b32a12287f3d369675fe27c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.5/gh-grep_v1.2.5_linux_amd64.tar.gz'
      sha256 'df151cb6b835f88a78b85b774f8427c01e20da2eeb6538a51c79147b9a091340'
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
