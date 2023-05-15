class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.6.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.6.0/gh-setup_v1.6.0_darwin_arm64.zip'
      sha256 'de3c8b7ce4eeeeb5c89543a21fe449560b2ac32350733a152fb3608cae532ed8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.6.0/gh-setup_v1.6.0_darwin_amd64.zip'
      sha256 '144d2038813c01f85f658569777c4dd487b163239b0a3e1f84fea44283e78479'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.6.0/gh-setup_v1.6.0_linux_amd64.tar.gz'
      sha256 '63761ed58fcb9647cb6e79ed7d64749900a3cf8f10805b68c3949dff7d96ecbb'
    end
  end

  head do
    url 'https://github.com/k1LoW/gh-setup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-setup'
  end
end
