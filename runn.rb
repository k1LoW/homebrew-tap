class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.44.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.44.1/runn_v0.44.1_darwin_arm64.zip'
      sha256 '094de5f50e3c3f67ed8538e8f5ddd1d0b9dc519bd36b81b53c5683bae6eea23b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.44.1/runn_v0.44.1_darwin_amd64.zip'
      sha256 'bb31396fefb08df6b48df1ec6dafa14237143f2e3fc5a862ddb41d5b5313f771'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.44.1/runn_v0.44.1_linux_amd64.tar.gz'
      sha256 '365a2976013436ad0b181ffdae872c2d3dd9d4ed0e4e1676b3a80f368e333cb0'
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
