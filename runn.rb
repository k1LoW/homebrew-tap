class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.123.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.123.1/runn_v0.123.1_darwin_arm64.zip'
      sha256 '922dd647a5d8d566adec0868b21d05b47f772d0ad06bd5a69704e83175690f7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.123.1/runn_v0.123.1_darwin_amd64.zip'
      sha256 'f5b0623c3ebe42879bb7a73134af40c3905ca9e4f36b2c5a060baef879d6eef5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.123.1/runn_v0.123.1_linux_amd64.tar.gz'
      sha256 '690311eaabbf4c7d4e1c98700df181c9141fbe7600725eefd3bd067e08638a2b'
    end
  end

  head do
    url 'https://github.com/k1LoW/runn.git'
    depends_on 'go' => :build
  end

  def install
    system 'make', 'build' if build.head?
    bin.install 'runn'
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
    (bash_completion/'runn').write output
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
    (zsh_completion/'_runn').write output
  end
end
