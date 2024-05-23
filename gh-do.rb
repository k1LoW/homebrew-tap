class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.0/gh-do_v0.5.0_darwin_arm64.zip'
      sha256 '26ef1bb18aa03920d941600db588ac9a3f83ac6b7bc49b84d0c7084f7ad0ab0c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.0/gh-do_v0.5.0_darwin_amd64.zip'
      sha256 'f02faa3f3b9d32602635f679bda54cb7fe4290e682e57039c31b98ff5326f32b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.0/gh-do_v0.5.0_linux_amd64.tar.gz'
      sha256 '59fee48371e7b6556a39867049229be02ea9af2d2d9ecc874de7cd22ca8d6159'
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
