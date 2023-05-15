class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.1.1/gh-do_v0.1.1_darwin_arm64.zip'
      sha256 'b9570c32416ae505296062f4c7ffba113692d5e35dc9156b4433f11f25abdec5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.1.1/gh-do_v0.1.1_darwin_amd64.zip'
      sha256 'b1c32aa8924d09929f753870ed2227a9c1850bfa97c7ef868a24f3c86f53a15d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.1.1/gh-do_v0.1.1_linux_amd64.tar.gz'
      sha256 '29a4f51ea0b9091ab780ab486d09048b6ec1ae9b7a8982acb2de30a5732a8e74'
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
