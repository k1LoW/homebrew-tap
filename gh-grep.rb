class GhGrep < Formula
  desc ':octocat: Print lines matching a pattern in repositories using GitHub API'
  version '1.2.4'
  homepage 'https://github.com/k1LoW/gh-grep'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.4/gh-grep_v1.2.4_darwin_arm64.zip'
      sha256 '2f1d6d2b5be0f59d5d5319e450afdb4e47c0b813bb21f477ba611475dbf56a7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.4/gh-grep_v1.2.4_darwin_amd64.zip'
      sha256 '562c53a7535994f03cf65976670e7f2060e9caf6cae9cb90617b419ec966faa7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.4/gh-grep_v1.2.4_linux_arm64.tar.gz'
      sha256 'f5ecfccd87500473c0b32359247b6d8a19080a7b2e1a4ed09c5d6bfaabdadc2d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.4/gh-grep_v1.2.4_linux_amd64.tar.gz'
      sha256 '1c9d87bed1618850d1510df20e6160b7e03910b4d612fc393200501ab7b7a179'
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
