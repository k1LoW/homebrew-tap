class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.5.3'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.3/gh-do_v0.5.3_darwin_arm64.zip'
      sha256 'a1574c083d361e9aa34eed868c12acfcb3d18969b5364e999b3bc4eb839beef9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.3/gh-do_v0.5.3_darwin_amd64.zip'
      sha256 'e7f9929eb8c5ad93abee26edab2098e9eedb6a6ca38662d03a939442316730d5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.3/gh-do_v0.5.3_linux_amd64.tar.gz'
      sha256 'fd84f75c52e8c6b447ba498c2d4f752bba1d5978f010df9940ee5fd1bd80c622'
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
