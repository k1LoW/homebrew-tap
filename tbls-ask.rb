class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.4.2'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.2/tbls-ask_v0.4.2_darwin_arm64.zip'
      sha256 '2ace290340ca1a05865f9499b3ac79f7c4c644e3adc783bcfdd1c10e1380eb4c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.2/tbls-ask_v0.4.2_darwin_amd64.zip'
      sha256 '2cc8ceb6a9dca6b87956a2db8daec842fc636c31144c28dff757550614ba3c97'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.2/tbls-ask_v0.4.2_linux_arm64.tar.gz'
      sha256 '46cb12065ddea78c248237ffe795a302400d20f1e68d5ebcf32d26e90241fe3c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.4.2/tbls-ask_v0.4.2_linux_amd64.tar.gz'
      sha256 '4845131c4b41be2dd93710ba7f0342bb8af8c23512d143ca0c218b527bf8aeda'
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
