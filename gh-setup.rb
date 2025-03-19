class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.9.2'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.2/gh-setup_v1.9.2_darwin_arm64.zip'
      sha256 '1846744917f18029b551e89fcf3bfc07d8229aac8e9977105b2f26a60e66cecd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.2/gh-setup_v1.9.2_darwin_amd64.zip'
      sha256 '85ccbb6263f4961318c8920912c3ff940965d943ad547e077fc25578bb1657a2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.9.2/gh-setup_v1.9.2_linux_amd64.tar.gz'
      sha256 '134d04df45860f2b859c020583b27989b6ad8a8144bd534a5536a9c405bafaee'
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
