class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.2.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.2.0/runn_v1.2.0_darwin_arm64.zip'
      sha256 '0658ce4f33b1b205af7724775bc0299acac1e0a53185aeca21a789f373ee71b7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.2.0/runn_v1.2.0_darwin_amd64.zip'
      sha256 '6ad6ff2157b0f7ac8e53057a5d7a7a5e731d9bd846cf1b3fbd9852b36647ac96'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.2.0/runn_v1.2.0_linux_amd64.tar.gz'
      sha256 'e12eb07115e00e0abfb84b2dc991628d79f060882411cbca83c1970962cb2c1f'
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
