class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.3.3'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.3/coglet_v0.3.3_darwin_arm64.zip'
      sha256 'a0b0aecd66ccb0526b18d9913fdc2275f7fc350885a4a285f90268acac39992a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.3/coglet_v0.3.3_darwin_amd64.zip'
      sha256 'b36bc09ccbf07f03fd1e07b01e4a1bfccf674bbd9f29e5009d29a26568b8c10d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.3/coglet_v0.3.3_linux_arm64.tar.gz'
      sha256 'f28f420c2efd0e2b24d7c3f06c59a4f654cdf4b3a8e5ee34d6f976b6ede3ef5c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.3/coglet_v0.3.3_linux_amd64.tar.gz'
      sha256 'beebd1ba4c281802c773a55bb602464dce83186f68d1655bda9f8650fc003d1e'
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
