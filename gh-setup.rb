class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.9'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.9/gh-setup_v1.11.9_darwin_arm64.zip'
      sha256 'fe7ed1f5a11c1650435f313cf98d7f1b0da7faae8e88c02fe714c432ae528565'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.9/gh-setup_v1.11.9_darwin_amd64.zip'
      sha256 'ce070ef6bc8aa0a04655b10515784470d08cb92d5bae827bc84a675836794022'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.9/gh-setup_v1.11.9_linux_amd64.tar.gz'
      sha256 '33fa42c082f5a26dafb97072657b56b0cd14e48334ced629e3ec1dc38c3d9202'
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
