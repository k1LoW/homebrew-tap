class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.5.1'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.1/gh-do_v0.5.1_darwin_arm64.zip'
      sha256 '28f570efc2ae2edfc662f12d98a05aeb55b6aaee459b118811a940cc96b938af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.1/gh-do_v0.5.1_darwin_amd64.zip'
      sha256 'c03f469fbe8cc951ed919cc99de31fdae25b5c84bd1b57aae6cce58e7450e8a3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.1/gh-do_v0.5.1_linux_amd64.tar.gz'
      sha256 'a917fb39c6882ba44e6d6d8ae625af0a5472a25eb74f8ee14408e6c93ab1abf4'
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
