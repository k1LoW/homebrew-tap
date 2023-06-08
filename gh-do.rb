class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.3.3'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.3/gh-do_v0.3.3_darwin_arm64.zip'
      sha256 '8be5726299b781d98bd61708b6b7f81b5011e58935d89ca290b2d8331d43ba7a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.3/gh-do_v0.3.3_darwin_amd64.zip'
      sha256 'ab8f3abb7dec1c2192f026e0bf8e5580fa3f3b8551ecd21b10a7ac3b7aaf5f1d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.3/gh-do_v0.3.3_linux_amd64.tar.gz'
      sha256 'c9f2f131ef0456e4fd9ceb4399a54f77d1e12c688b72a803465bc1008634f581'
    end
  end

  depends_on 'gh'

  head do
    url 'https://github.com/k1LoW/gh-do.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-do'
  end
end
