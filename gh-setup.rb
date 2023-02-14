class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '0.7.4'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.4/gh-setup_v0.7.4_darwin_arm64.zip'
      sha256 '9309d70122b4a8c4b3744a9b805fe8c44757bcd69f4b885fff6176eee75153bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.4/gh-setup_v0.7.4_darwin_amd64.zip'
      sha256 '33ab27e89a8a4c3a7c10b687277ea79b5f9df73cc0d5df55c0b517b0c9534ba1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v0.7.4/gh-setup_v0.7.4_linux_amd64.tar.gz'
      sha256 '983e1baa6479511c38736f8db8415eeae9249ac1719808c48c449e996e8f9194'
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
