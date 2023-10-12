class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.3.4'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.4/gh-do_v0.3.4_darwin_arm64.zip'
      sha256 '60aef12e4b23fb8de351e9420376a5f94daa2b2ebc5a7556bef5a039227de17e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.4/gh-do_v0.3.4_darwin_amd64.zip'
      sha256 '344bbf8c7f32ed80574a3676f9e03b14ab9716ff6b37d95726af68e4cd12d6dd'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.4/gh-do_v0.3.4_linux_amd64.tar.gz'
      sha256 '22216b7021ee6821ed1b941f39230c47c3523fb92cf3c04ad65f62738c4e51ee'
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
