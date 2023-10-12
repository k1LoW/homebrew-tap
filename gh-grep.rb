class GhGrep < Formula
  desc ':octocat: Print lines matching a pattern in repositories using GitHub API'
  version '1.2.1'
  homepage 'https://github.com/k1LoW/gh-grep'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.1/gh-grep_v1.2.1_darwin_arm64.zip'
      sha256 '8ce7e087cbcbe6b922bb34f3431084e1498f07892cb6ee612ff35d126c3b1435'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.1/gh-grep_v1.2.1_darwin_amd64.zip'
      sha256 'a1e0fb06a2db36d1a3aabb777f1c238caa07113477ad67702dd0a228174e0bb6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.1/gh-grep_v1.2.1_linux_arm64.tar.gz'
      sha256 'fd0d7faa5b955b809cdcf04cc9a927eb287231052ed5c1dad3ef238ba35ec4e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.1/gh-grep_v1.2.1_linux_amd64.tar.gz'
      sha256 '6b9fc0bd43660537edd8e43206035a4ee26cd47d09ef12d45ce81c3cb78c095e'
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
