class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.4.2'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.4.2/gh-setup_v1.4.2_darwin_arm64.zip'
      sha256 '257f631346ac6f8f060f15a71274551fdcce21e0921c07a7c81db69f98eef36b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.4.2/gh-setup_v1.4.2_darwin_amd64.zip'
      sha256 '6cf8e25587a6c048d5c421b2adaf43ee3333d9d1f752322d668f40e8b209d1d9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.4.2/gh-setup_v1.4.2_linux_amd64.tar.gz'
      sha256 '89957aebd0267f16dedd6a01626566f0e896b8310fa46e3d3e9b7b6172bc3edb'
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
