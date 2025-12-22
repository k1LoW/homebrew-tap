class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.4.2'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.2/coglet_v0.4.2_darwin_arm64.zip'
      sha256 '376ccecafc635a12145c631729cecd4e5adc0beecd9844440759d161ba16b1d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.2/coglet_v0.4.2_darwin_amd64.zip'
      sha256 'f689c0395097cce4d8e9b1208c6456590ea718195fffdab4bd02ffb1318726ca'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.2/coglet_v0.4.2_linux_arm64.tar.gz'
      sha256 '8f466b3291fc4ebddb1d1f1b0865131de2507c5d1dd2189f489591e6e80a9910'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.2/coglet_v0.4.2_linux_amd64.tar.gz'
      sha256 '8e0569ed3533a971797e53ccc4de064e75e6d7aa8357e20342f8e51bf0655e67'
    end
  end

  head do
    url 'https://github.com/k1LoW/coglet.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'coglet'
  end
end
