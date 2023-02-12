class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.0.3'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.0.3/gh-setup_v0.0.3_darwin_arm64.zip'
      sha256 '494b732f40b78761d3ea6d929648d1ba33b1648442afa0ca022871c8e5c1806f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.0.3/gh-setup_v0.0.3_darwin_amd64.zip'
      sha256 '0f71fa95bca5f8a8ab70542f03fc69fde1c1b66a09132976e11d15f9a60305b8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.0.3/gh-setup_v0.0.3_linux_amd64.tar.gz'
      sha256 '02e7e20f17e67933263f2a87db471112ed24d7c88d048cc232531bf8af89ca12'
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
