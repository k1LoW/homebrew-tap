class Gostyle < Formula
  version '0.10.1'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.1/gostyle_v0.10.1_darwin_arm64.zip'
      sha256 'a598a7f8cb16097d04a02cd622b60d2ffb419a152650012441be622c35204546'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.1/gostyle_v0.10.1_darwin_amd64.zip'
      sha256 'eeb25a9807ced3decd04611fead580c10a9d8f7f61af3d28581a6887b4c9b8b4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.1/gostyle_v0.10.1_linux_arm64.tar.gz'
      sha256 '4dc026a5ac5db5c34571e9937508cc85b7edaa617d8ae143313ccca650f71f6d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.1/gostyle_v0.10.1_linux_amd64.tar.gz'
      sha256 'ebb30ebae3a711a92701eea91b0afffc9e1071c542be68575a4ff8d41441d0ff'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
