class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.1/gh-do_v0.3.1_darwin_arm64.zip'
      sha256 '2085a4d74e050787e006ad998f0a09ba25af61fee6f3c9b0ea055d286ae519d0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.1/gh-do_v0.3.1_darwin_amd64.zip'
      sha256 '0b01abbe6b028c5f2a1aa6fc43a708802ac521a9c8f9210e5397066016bbdaea'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.1/gh-do_v0.3.1_linux_amd64.tar.gz'
      sha256 '1dd3407e708c23b0c536e8f3b43dbe5fbfda70f35c9285470b7e7e63e47ec816'
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
