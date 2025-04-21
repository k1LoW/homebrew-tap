class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.1'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.1/gh-setup_v1.11.1_darwin_arm64.zip'
      sha256 'b2fa6b2cd48edd4c2f98337b8eb561fd13e5b013cd929f61378276a81713f8d6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.1/gh-setup_v1.11.1_darwin_amd64.zip'
      sha256 '75f7d0376feb773b3e2bd22a6fccedb63639eace252b1cb221c1a6a7e928892a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.1/gh-setup_v1.11.1_linux_amd64.tar.gz'
      sha256 'bb821456a3eb184c7ce8bd8cea5b87fdd012b1bffe55b507cdb18bfd52f40435'
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
