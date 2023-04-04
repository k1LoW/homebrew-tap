class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.3.0'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.3.0/gh-setup_v1.3.0_darwin_arm64.zip'
      sha256 '4e40f4d43d4efb3536e06cd20f59e737d9a703d0ba8835b42b031474936be77d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.3.0/gh-setup_v1.3.0_darwin_amd64.zip'
      sha256 'a3c4abdbf2de8e938dc6096f44ed25fb7a64b6e39e911848c458302ee7a80ba3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.3.0/gh-setup_v1.3.0_linux_amd64.tar.gz'
      sha256 '22b04c5520fbdc9318b89658a878e7529eb279b079b5345616958fd56dbd766f'
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
