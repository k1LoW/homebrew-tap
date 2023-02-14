class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.7.3'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.3/gh-setup_v0.7.3_darwin_arm64.zip'
      sha256 '042d747e59ab0272a4ce3c6e3d254127bcc60c256f43219a91b72003d57dcac7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.3/gh-setup_v0.7.3_darwin_amd64.zip'
      sha256 '62dfb9e6c6d929594b41bd5c929c27526319d43e89a4840312b4cda412d59873'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.3/gh-setup_v0.7.3_linux_amd64.tar.gz'
      sha256 '3a551c0a18c16522a5a67d0f70fb6a57af9b2acef344c9ac051c8f1cc6cacbd5'
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
