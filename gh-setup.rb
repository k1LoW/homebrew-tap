class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.3'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.3/gh-setup_v1.11.3_darwin_arm64.zip'
      sha256 '467a7e31c1d20e838be769edcb542f2bc2ba796f0d5abf4749cdc2d83c9a8c5c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.3/gh-setup_v1.11.3_darwin_amd64.zip'
      sha256 '625cff50fa02ab62a32884e53ff91039a4c701197df93b3d60018041b72b4265'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.3/gh-setup_v1.11.3_linux_amd64.tar.gz'
      sha256 '0d05eeee71dace38f442aa4b3fdc18f7865b0ae11c2905cebc7dc939a7da614a'
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
