class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.0.5'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.5/tbls-ask_v0.0.5_darwin_arm64.zip'
      sha256 '1093ca45eda6a2bb0898fd1bd3f4b2a4f011dcdb82c0fec643edfe1e5824c51c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.5/tbls-ask_v0.0.5_darwin_amd64.zip'
      sha256 '30f30abf8c27af885a5221ba9005a37db74a6d33b2bf0c456b045ed76b968749'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.5/tbls-ask_v0.0.5_linux_arm64.tar.gz'
      sha256 'a64679bc33ebb237c5b790b4abb0973f095a03d35d4d660c4a58d77ff1b95c46'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.0.5/tbls-ask_v0.0.5_linux_amd64.tar.gz'
      sha256 '9754f847ffb712a4b32f7c8535f3c4df55f65c58dcd80682585d29f015ddfc34'
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
