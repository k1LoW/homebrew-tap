class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.1/tbls-ask_v0.3.1_darwin_arm64.zip'
      sha256 '1583ae4744388d6c7e5fb4f6bcba558c5c441881b3c013690baae3e370880e6e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.1/tbls-ask_v0.3.1_darwin_amd64.zip'
      sha256 '7312849f8f0ea3b090a470ddc79c8d25b9b3dce32dff4b546597e3d85511cb1f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.1/tbls-ask_v0.3.1_linux_arm64.tar.gz'
      sha256 '1775cff03e8239b33f439e0a3c41e00fee8bfefcc9796486ff264b135966942f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.3.1/tbls-ask_v0.3.1_linux_amd64.tar.gz'
      sha256 '07a556a1b288a65d77e58a18009654e08f941613532118e23734010b7d59ec0c'
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
