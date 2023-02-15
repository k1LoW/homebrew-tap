class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.8.3'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.8.3/gh-setup_v0.8.3_darwin_arm64.zip'
      sha256 'f25f25f5450ee3fa140747171ee3b54ec747ebbbfdbd4d02a60a226e5d2d2067'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.8.3/gh-setup_v0.8.3_darwin_amd64.zip'
      sha256 '3b369721558cba76ee12c82502600b8e51d797f54a4de2773b7ab7f3856890de'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.8.3/gh-setup_v0.8.3_linux_amd64.tar.gz'
      sha256 '71de5e038cfad76439a5b7006176f27b7aa292168a2a9b4503973fde61901ad9'
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
