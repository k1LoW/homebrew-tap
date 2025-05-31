class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.2'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.2/gh-setup_v1.11.2_darwin_arm64.zip'
      sha256 '7d7c3e78a7b3645921af92c61c78dd968e2efc02e3ac37173d13318fe796436a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.2/gh-setup_v1.11.2_darwin_amd64.zip'
      sha256 'c15e6a7859373de9d74e233f2358d322a42cefbd9f79585ee3c9e056517b2911'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.2/gh-setup_v1.11.2_linux_amd64.tar.gz'
      sha256 '740f5ccf336b1f51255cbc71202b765a4a2ef992d5b8531846e81e0e3959602b'
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
