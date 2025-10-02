class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.5'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.5/gh-setup_v1.11.5_darwin_arm64.zip'
      sha256 'ef732a679c7a452c056d83a4a7b7e37771134bb8abe4b66c0ae3629d5ed78d82'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.5/gh-setup_v1.11.5_darwin_amd64.zip'
      sha256 'd9765c15d6d4ccd564b7348725e0605ace935f2a0c9b6242934e2060d731c84a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.5/gh-setup_v1.11.5_linux_amd64.tar.gz'
      sha256 '4fd9b5faa7d22162b8f08b4ca34af6f72ae7de4533baab20df6c9fca649a3984'
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
