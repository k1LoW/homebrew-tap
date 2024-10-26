class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.2.0/tbls-ask_v0.2.0_darwin_arm64.zip'
      sha256 '76fdaa7e07f6308f53a30bc8ac86346fed1c9c6918a42141d1016730c7451dcb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.2.0/tbls-ask_v0.2.0_darwin_amd64.zip'
      sha256 'f2a94893b92978320f9965e1ddfbdee88decefe7397b1dbb81e259ffe355db2f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.2.0/tbls-ask_v0.2.0_linux_arm64.tar.gz'
      sha256 'cd4706ee623e867c9449883678fd18d3a97eae574543fd6d5bcd46b23104c1a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.2.0/tbls-ask_v0.2.0_linux_amd64.tar.gz'
      sha256 'b4ce8529ebcdcba204535c9f7d10727d7674079076c8dc99f82450cc66ec0ae2'
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
