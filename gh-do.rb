class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.3.2'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.2/gh-do_v0.3.2_darwin_arm64.zip'
      sha256 '6709bcb58b33a85bc8029e8530960dd44fab8316d40d3302d3d3f1d3201054c3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.2/gh-do_v0.3.2_darwin_amd64.zip'
      sha256 '0d66e2520a634e182735475cdaac05cfab6499d8a56c4e588d9159f03ccb1d93'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.2/gh-do_v0.3.2_linux_amd64.tar.gz'
      sha256 'fd61eca0ab95f68c79c20840fe5f5c46b46e2c1f6c51bdaea6cb5df04fa97f5b'
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
