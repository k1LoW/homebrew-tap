class Coglet < Formula
  desc 'coglet is a tool for User pool of Amazon Cognito.'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/coglet'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.1/coglet_v0.1.1_darwin_arm64.zip'
      sha256 'd185e9def904de26da1fe91cebf73a238fe4929a33421bd74c9d818a5f02d453'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.1/coglet_v0.1.1_darwin_amd64.zip'
      sha256 'c68b116a1349722b014c9a4040b6dd55fcdf2624867acec2aa97afc541d1fd36'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.1/coglet_v0.1.1_linux_arm64.tar.gz'
      sha256 '3516bf718aa27c60ddd88cd12e02de36e999168e79640ba74fba9b65225c2f8c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/coglet/releases/download/v0.1.1/coglet_v0.1.1_linux_amd64.tar.gz'
      sha256 '695a4471fa078c2fbb53b060ee653c135922e958ad2c005afb0e55239bf8c40f'
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
