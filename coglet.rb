class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.0.3'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.3/coglet_v0.0.3_darwin_arm64.zip'
      sha256 '8ba71ff852016565771847864cb56e386347d016885ade86f7123266be830bc8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.3/coglet_v0.0.3_darwin_amd64.zip'
      sha256 '0df2e79e0448bfc366d70d399b3dc7eb71f2b8bcaecf55da3da12ca8e30d5eba'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.3/coglet_v0.0.3_linux_arm64.tar.gz'
      sha256 'a1c3310626ddb2f5eb97640d3f2139bdede36a96a0ecb5a1fd1be931973648f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.0.3/coglet_v0.0.3_linux_amd64.tar.gz'
      sha256 '28460ec3dfe8bd44f428c98d731be316fad04c5cea20c4b895711732514bb658'
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
