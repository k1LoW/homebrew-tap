class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.36.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.0/runn_v0.36.0_darwin_arm64.zip'
      sha256 '4285c276c1281b913242cf81bcdc67469d003d76829c5af0797d0cd05e3b39f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.0/runn_v0.36.0_darwin_amd64.zip'
      sha256 'a44f01dd1d058347a2918376ac170e1e13a8a63dacbc6c0333a51c26d98d0d79'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.36.0/runn_v0.36.0_linux_amd64.tar.gz'
      sha256 '8817fb84a4a97911ae6059bd3cebc74f9ffd04ec25ed7c3c2b2d81b4dd861a4a'
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
