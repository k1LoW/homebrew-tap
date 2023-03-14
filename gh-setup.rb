class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.2.2'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.2/gh-setup_v1.2.2_darwin_arm64.zip'
      sha256 '07d9ca146486c0f10d48397f117d0ef7b7a3b6fe30a4bbe55d38f76ffad91b5e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.2/gh-setup_v1.2.2_darwin_amd64.zip'
      sha256 '823cb8d898f228fe8c22a3d325a6eb4ca85c59e0e12ce3ac2581c1c231d31b8d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.2.2/gh-setup_v1.2.2_linux_amd64.tar.gz'
      sha256 '09509d616769fe8dde18219c51d58f260299fac8cedadac9d8023316aaf3d953'
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
