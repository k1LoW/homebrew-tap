class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.4.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.4.0/gh-setup_v1.4.0_darwin_arm64.zip'
      sha256 'd4d821c02a8734f5d6d14fb07bb9d7fd382dbce987f2662ef356cf791a7692f2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.4.0/gh-setup_v1.4.0_darwin_amd64.zip'
      sha256 'c96dc27c8317e0bf568954c51546e7203ca20b3695915b20b35408fb123bae42'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.4.0/gh-setup_v1.4.0_linux_amd64.tar.gz'
      sha256 '597e4b94d7e77fe0b72f11aa4d4f70750c327ff2b62af624e7c02a1c4539b3d2'
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
