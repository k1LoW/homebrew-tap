class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.7.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.7.0/gh-setup_v1.7.0_darwin_arm64.zip'
      sha256 'c0ed567b51a067544f966a3ea8911845f430dd557c087f740fa3d33431faad69'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.7.0/gh-setup_v1.7.0_darwin_amd64.zip'
      sha256 '80cf6a9a0a08bbc6c27f5f786546129abe5aa6ea89baddd881081b8247ebfcb7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.7.0/gh-setup_v1.7.0_linux_amd64.tar.gz'
      sha256 '71928f97242f3a5444589b077195c89de5e43efad3323e5e1d5b61a907ea0d8a'
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
