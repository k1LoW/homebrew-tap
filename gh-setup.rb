class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.9.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.0/gh-setup_v1.9.0_darwin_arm64.zip'
      sha256 '345320cc52c478f04b928e1d4059bf4d8ede37a99857418aa8a00e284bac3e5d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.0/gh-setup_v1.9.0_darwin_amd64.zip'
      sha256 '917cdb39e127504cb1d543f6724d873fd6fa71f0ce4bccb4f6f69aa9d99c8ade'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.0/gh-setup_v1.9.0_linux_amd64.tar.gz'
      sha256 '0dd8baa3b42872b7dc6a7a7583e713bebc434acd0f950cb653fe4d0388bb4fb0'
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
