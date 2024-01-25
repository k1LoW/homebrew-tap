class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.4.0/gh-do_v0.4.0_darwin_arm64.zip'
      sha256 '83f9b1a9f8987ec97053bf9a21f0059156880a0e6106d24e2fd08b26733b2da7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.4.0/gh-do_v0.4.0_darwin_amd64.zip'
      sha256 '56c94546ee6d7cd2f920cf9e34f6d1d5d58e0ac2d6df25cb9481f6a780ee4571'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.4.0/gh-do_v0.4.0_linux_amd64.tar.gz'
      sha256 'c4ec1a86597e6e22be720865435052f2425bb01282c79be10827c136ce56929e'
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
