class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.1.3'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.3/gh-setup_v1.1.3_darwin_arm64.zip'
      sha256 '5d16c91230535650f393461c031ae4453ef1eb809f9030e6369fed870f74d3ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.3/gh-setup_v1.1.3_darwin_amd64.zip'
      sha256 '0631f768c0368033b3aa03676aca0f077dc96f0215f1d17b459d6dffd19ef291'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.3/gh-setup_v1.1.3_linux_amd64.tar.gz'
      sha256 '7953f274cdacd6741a4874b964c49c99677168728662ccaae880f82e8ddaf5ed'
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
