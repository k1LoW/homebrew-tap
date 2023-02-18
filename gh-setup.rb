class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.1.2'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.2/gh-setup_v1.1.2_darwin_arm64.zip'
      sha256 '0b728500609af75340ce2302e67c83cd6c919ac9ab5dbba5bfdba549305b5e92'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.2/gh-setup_v1.1.2_darwin_amd64.zip'
      sha256 '50d66dadb2cf58ed0da0c487bdfc147136db0df158745fbe6efcec7f97606eb9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.2/gh-setup_v1.1.2_linux_amd64.tar.gz'
      sha256 '0640dba33a324c5164994d4a485903cebea36c6bba3d6add05ee067c9d13895a'
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
