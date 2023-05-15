class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.0.3'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.0.3/gh-do_v0.0.3_darwin_arm64.zip'
      sha256 '36100dc1c366811f96fae67b98dfe3d19c084a6741fcf7a44bbfa8bf1f2db80e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.0.3/gh-do_v0.0.3_darwin_amd64.zip'
      sha256 '790deb396e26b131661897d582d7d4371d90b6f5681723e8a77c04ef9cd34dff'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.0.3/gh-do_v0.0.3_linux_amd64.tar.gz'
      sha256 '904daaeb6da12302782006edb6110701d34dce9a4a4d6d926e7372ea511f751a'
    end
  end

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
