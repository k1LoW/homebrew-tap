class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.8.4'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.4/gh-setup_v1.8.4_darwin_arm64.zip'
      sha256 'e69a66fd9c31a01309129f1052d9bbeed288e0edeebf7368035661b5e3a1cc30'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.4/gh-setup_v1.8.4_darwin_amd64.zip'
      sha256 '28b32b5b0962f2a10114aecdaeacd76e8359bd06e7d00f37d938792505f1071b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.4/gh-setup_v1.8.4_linux_amd64.tar.gz'
      sha256 'eff134317a82f40fd5d23c9aca218b4e714f4907c3abe8fdf35d3f5ccd90d16d'
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
