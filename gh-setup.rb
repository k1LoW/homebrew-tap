class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.10.2'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.2/gh-setup_v1.10.2_darwin_arm64.zip'
      sha256 '5b2d7d6ee1af0d732067bb423d440e073ac49997748a61c1448de37568b125bf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.2/gh-setup_v1.10.2_darwin_amd64.zip'
      sha256 '9e5901745204f97953b4a225ab1ad427d35825e8276c09eb1d654c0cac69e53d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.2/gh-setup_v1.10.2_linux_amd64.tar.gz'
      sha256 '08a64e2c127491dd6e1d1484253ac95ca68c895461d8a571d081bf1c0f00f5bd'
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
