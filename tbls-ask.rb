class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.7.2'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.2/tbls-ask_v0.7.2_darwin_arm64.zip'
      sha256 'd7c1a58d7291a45eec6681223af924753ca6b725b4aabe7464dca4c1bdb3b428'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.2/tbls-ask_v0.7.2_darwin_amd64.zip'
      sha256 'd645e4b7efb71837e9667decab67bd5171790718b1ac46f781bcccc0c86b8028'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.2/tbls-ask_v0.7.2_linux_arm64.tar.gz'
      sha256 'bc45d5cafd4e175fe190e91fc838178f2e3980e0ff37603a1b9856621d69a583'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.2/tbls-ask_v0.7.2_linux_amd64.tar.gz'
      sha256 '6ee6a9dfd2469a2e6a44a0154d12ac892928f75ffd6086f39f6f3f4ccb5e31ee'
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
