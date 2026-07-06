class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.9'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.9/tbls-ask_v0.6.9_darwin_arm64.zip'
      sha256 'fd623973c2fa9599771fdf0002f0ceae5f8f36117710b8200e1ee7b567ea2a91'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.9/tbls-ask_v0.6.9_darwin_amd64.zip'
      sha256 '542b3ca0454ef2137609f0d366e55e9e2f79c177f6192e1f91cef4e649088c6b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.9/tbls-ask_v0.6.9_linux_arm64.tar.gz'
      sha256 '11b57d48b3ec3a47fad4ca5e9aa04ebd9be90b65225963222772b6c14bda2a0a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.9/tbls-ask_v0.6.9_linux_amd64.tar.gz'
      sha256 'ebf1bd711174d820953b4da6e24748668aea9b35886ce2f8d5932a58cc4ac980'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-ask.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-ask'
  end
end
