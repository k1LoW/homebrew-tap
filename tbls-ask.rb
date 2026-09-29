class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.7.1'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.1/tbls-ask_v0.7.1_darwin_arm64.zip'
      sha256 'c16692113500a9754e04f0009ce6fc3978e90491660be74a919101c55f03c464'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.1/tbls-ask_v0.7.1_darwin_amd64.zip'
      sha256 'b1efec3ccaf7dd1095dd27358a12e74eae5dcfa343ce6042cd6814e765d9355a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.1/tbls-ask_v0.7.1_linux_arm64.tar.gz'
      sha256 'd14508d7fc45935c5a1d7a904c25fe3180f98dda1102ab644c0b98a29d28946d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.7.1/tbls-ask_v0.7.1_linux_amd64.tar.gz'
      sha256 'ca52b9045ec4d7949a55e03d22786837f2b3c07251c27f8ff3885fe68f6b6e17'
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
