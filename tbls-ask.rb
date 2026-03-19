class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.7'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.7/tbls-ask_v0.6.7_darwin_arm64.zip'
      sha256 'e0bec70a7ce94ec1d91b26fa261c439d81c92292c9610924027c1d23bbf5c157'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.7/tbls-ask_v0.6.7_darwin_amd64.zip'
      sha256 '269c3ce432ca2dc3c7298ecc803d9579265a2d186e8485e347055e6f61924db3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.7/tbls-ask_v0.6.7_linux_arm64.tar.gz'
      sha256 'd4010bc79d54c7513cb4a81a408e061c9a4b67f591d9dcec805934c287950560'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.7/tbls-ask_v0.6.7_linux_amd64.tar.gz'
      sha256 '1ed666fde32987c84ecea913d630d6f9c355db8b30c3bb4edf94174598a5ed27'
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
