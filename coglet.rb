class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.3.2'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.2/coglet_v0.3.2_darwin_arm64.zip'
      sha256 'b0cce651fafaf458251a4c341d4dd53e8d73f79509126325281977ff27d500f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.2/coglet_v0.3.2_darwin_amd64.zip'
      sha256 '1198aee4edffb476a46c649735560b6acf60ee5fe07e9b7f69ef0787908b022c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.2/coglet_v0.3.2_linux_arm64.tar.gz'
      sha256 'a32186b7e55acdfc9f73ef289c4581d5867396f049845865480aa421f8022c71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.3.2/coglet_v0.3.2_linux_amd64.tar.gz'
      sha256 '9146d3b56b152acb425da4fd35f60df986b5d98e3b9f0a71a2f5a06a6a0ac82e'
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
