class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.10'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.10/gh-setup_v1.11.10_darwin_arm64.zip'
      sha256 'cff59845b308ddc2c89cc863ff44b6d9ab0a5b94d960e2404bad236273f1bf13'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.10/gh-setup_v1.11.10_darwin_amd64.zip'
      sha256 '408017e85fb464df6645c07d3844922c6af4974159ee651bd787ff01640d421d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.10/gh-setup_v1.11.10_linux_amd64.tar.gz'
      sha256 '1bf624011d81c3663d35ce6292c763d59471bbcafdb391a1d37e479fd85b769c'
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
