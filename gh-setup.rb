class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.8.2'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.2/gh-setup_v1.8.2_darwin_arm64.zip'
      sha256 '3ca3d781c3e0b30e3ada56cca92346aa93257c1605a774a4318a6b6a6b18dba7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.2/gh-setup_v1.8.2_darwin_amd64.zip'
      sha256 '97985407e3aaf3776e477e73db471c83173456cda19e389685a98a69e6b2efcc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.8.2/gh-setup_v1.8.2_linux_amd64.tar.gz'
      sha256 '586a21de5096827679300afc25983019bc26acd1f0fe9bf88f43da87f5bba6ef'
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
