class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.0/coglet_v0.4.0_darwin_arm64.zip'
      sha256 '8b93714deb636fa842462b9d187b1c75760c3525ac469823d9b36cbc36b025ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.0/coglet_v0.4.0_darwin_amd64.zip'
      sha256 '8866d4cecc2eaf38b7fc8f81308f6fcf367d3c0e125ef6b72ca5707e26f1b160'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.0/coglet_v0.4.0_linux_arm64.tar.gz'
      sha256 'b3b6f4b3043d0dc08d95b4d277ad29e0c767c2cdc84d85f45be211159cf182a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.4.0/coglet_v0.4.0_linux_amd64.tar.gz'
      sha256 '244975f062d56ec263a385eba6cfbcc246e1511f633704addaf02f09c28447b5'
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
