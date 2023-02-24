class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.1.4'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.4/gh-setup_v1.1.4_darwin_arm64.zip'
      sha256 '911cea6bd6d1e59f9643b485bd5b4186c0182d5c0f85997bf5169b7de344cb6f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.4/gh-setup_v1.1.4_darwin_amd64.zip'
      sha256 'a0660af9301ecd03faac0baafa7ba7c3dbe674c45dbffa5a6bfaa472e5f35b21'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.1.4/gh-setup_v1.1.4_linux_amd64.tar.gz'
      sha256 '995ee62df8bd0ea44aa0c521939686a0e12df0e871e34255278be5932a77ceb6'
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
