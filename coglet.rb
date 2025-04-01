class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.1/coglet_v0.3.1_darwin_arm64.zip'
      sha256 '20a22bbcaa528b51b82e250f3cb78f9ec7dd37737e9383ba0bb362e539540ebd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.1/coglet_v0.3.1_darwin_amd64.zip'
      sha256 'faff1f69408da9da4f0d55793f3674aee15f9797fb38177db27e793ca6ba93cc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.1/coglet_v0.3.1_linux_arm64.tar.gz'
      sha256 '97be4d89fe29a383b14949acb08771a01429f752b717d1fb17efe5c89bcbeb29'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.1/coglet_v0.3.1_linux_amd64.tar.gz'
      sha256 '5f2f28f3e6752e8c48864a67e712ff16e0976b427dd10ab25e681bb8630aed15'
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
