class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.6.0/gh-do_v0.6.0_darwin_arm64.zip'
      sha256 '1713c866daee0e26f2cc630ebc6636458a53f432e1a560fd6f4ab917581fa2d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.6.0/gh-do_v0.6.0_darwin_amd64.zip'
      sha256 '9c4f39b23149af800e0a1e6e89e07e9d6ced77d757d78d2d06f222181a2734e4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.6.0/gh-do_v0.6.0_linux_amd64.tar.gz'
      sha256 '6fe1174aa8fcfca208e36d2cb46779ee9fe3050238739b64d0e09ea30d2ddb28'
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
