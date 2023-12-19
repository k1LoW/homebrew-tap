class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.3.5'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.5/gh-do_v0.3.5_darwin_arm64.zip'
      sha256 'abb8c83641f8c8c3927a7aa3d6af12e9766b3a86fb7e3c0f8ec9699a248dcc73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.5/gh-do_v0.3.5_darwin_amd64.zip'
      sha256 '32b91e987f4e0119b9d26052164a7728596d29f0fd7a073d514ae3e60b1206f4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.3.5/gh-do_v0.3.5_linux_amd64.tar.gz'
      sha256 'fdd8dca33856557134d124947a578f64aeb8235375710c6ff9202cd0e23a24d5'
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
