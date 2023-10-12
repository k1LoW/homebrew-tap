class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.0.4'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.4/tbls-ask_v0.0.4_darwin_arm64.zip'
      sha256 '14f538fcdc40f53f1be9ba194fcefcca0549baab2ecca9b5d8bff6c7bec154fd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.4/tbls-ask_v0.0.4_darwin_amd64.zip'
      sha256 'bfa08a3a191355a5b45906446e3fbbd46752344f7c6240f3d86b479641711e92'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.4/tbls-ask_v0.0.4_linux_arm64.tar.gz'
      sha256 '10845a93030c4a2790a54793302e9e1dc710e3f4b7670d7c24edfac50d99de61'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.4/tbls-ask_v0.0.4_linux_amd64.tar.gz'
      sha256 '2999116c1bf52fcb16c61d485525b081b946ac53167518c7d1df1ecb3fd1f168'
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
