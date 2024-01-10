class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.3.6'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.6/gh-do_v0.3.6_darwin_arm64.zip'
      sha256 '4255a056cddc5323bb0db7a9a3a3c30e3ebffd5eb63d6153c5c2a3488e72545b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.6/gh-do_v0.3.6_darwin_amd64.zip'
      sha256 'b31cdc1f89cd3092734487fef11ee99097602955b5f7f944a0cfafc122f3813f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.6/gh-do_v0.3.6_linux_amd64.tar.gz'
      sha256 '3778fa3ce07febaa80a77b874f723561dc107709fe3c515a81f7a7dd6db11ebc'
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
