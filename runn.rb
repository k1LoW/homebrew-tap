class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.59.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.0/runn_v0.59.0_darwin_arm64.zip'
      sha256 '522d77f995a5b8f02b2c38e0f716dd8e38dcc9afd289ca804c90b4b850ab7b02'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.0/runn_v0.59.0_darwin_amd64.zip'
      sha256 '37c2e351500d1f8be499e2afca7c76065fcef0d3fe21a4d9000c91389a5426aa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.0/runn_v0.59.0_linux_amd64.tar.gz'
      sha256 'e46d45eb0c9b34a89345a304c8dc88431cbfd1a7b4addc2ba561c362bf830e9b'
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
