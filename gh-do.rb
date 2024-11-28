class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.5.2'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.2/gh-do_v0.5.2_darwin_arm64.zip'
      sha256 'd7c3fc5d97941bf9036e10253fdc3d513490d27cb00d15498f4c0140a1b4dbfe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.2/gh-do_v0.5.2_darwin_amd64.zip'
      sha256 '9c3a4a80a6989b5fd512e7af33218c54e0db3db717d2d5db01294257b061f1a4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.2/gh-do_v0.5.2_linux_amd64.tar.gz'
      sha256 '0ad1a8b9729c54dc82a319c5f02f2c16f9ad594f4e9c1c047d46aaeef3788603'
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
