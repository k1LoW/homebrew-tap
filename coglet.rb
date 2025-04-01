class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.1.3'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.3/coglet_v0.1.3_darwin_arm64.zip'
      sha256 'ec3bab8a035f75af1ab84e23f7a187c24fcaad341238acf00e9e003174f1ffb1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.3/coglet_v0.1.3_darwin_amd64.zip'
      sha256 'e3efaa87f0fc42b8837d174f492d1a92bb5900687e733156a6260487c18251b5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.3/coglet_v0.1.3_linux_arm64.tar.gz'
      sha256 '7912a0c11c83da8ff6357d3e6a9e52d1c4eb1f5be9914ce3110663bd8f633335'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.3/coglet_v0.1.3_linux_amd64.tar.gz'
      sha256 '63df12fcb577ac7d84fe56de391dd763d3891e7738b7e1db79d86eeeb09c1884'
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
