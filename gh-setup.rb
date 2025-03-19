class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.10.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.0/gh-setup_v1.10.0_darwin_arm64.zip'
      sha256 '534cd002dfd7332124fef313dfddfa8f3fd960c4f7a4629c962a110c866f1110'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.0/gh-setup_v1.10.0_darwin_amd64.zip'
      sha256 '8647f35cdd125050a94b9d184757393f971aa612c8fb364e3b8f3405488aa61a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.10.0/gh-setup_v1.10.0_linux_amd64.tar.gz'
      sha256 '1b6812a8634311833a4a62da27f13efe4a42d04776941b31a6f2c73f5c05f46a'
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
