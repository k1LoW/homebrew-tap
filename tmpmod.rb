class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.6'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.6/tmpmod_v0.4.6_darwin_arm64.zip'
      sha256 '7039cc695c0fe708c789dcd9272ceaee852b555ec9c075b0ba2cb23ee660b134'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.6/tmpmod_v0.4.6_darwin_amd64.zip'
      sha256 '49b97bbe43e9cf2156b3f6a653c9aae15123f9f8d2536e29e66eca94cf5f5ef6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.6/tmpmod_v0.4.6_linux_arm64.tar.gz'
      sha256 '6cff7452819feebc9df02528d633f2b4036f1cd4acfad9af9bbb445bd04cea31'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.6/tmpmod_v0.4.6_linux_amd64.tar.gz'
      sha256 '7ac23344cde8d8d18873c50c40a471042b809f4e5150aff65d57210f0c368d8c'
    end
  end

  head do
    url 'https://github.com/k1LoW/tmpmod.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tmpmod'
  end
end
