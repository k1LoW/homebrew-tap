class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.3.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.3.1/runn_v1.3.1_darwin_arm64.zip'
      sha256 'd2ff1b98d4813e69b1c66e3b3f5b2aa981de3b274b91eddd2343b6f7612eacdd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.3.1/runn_v1.3.1_darwin_amd64.zip'
      sha256 '0810447675a8b16d483efd4b1f7adbc62ff11624fbc37011d3b787cad276e8da'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.3.1/runn_v1.3.1_linux_amd64.tar.gz'
      sha256 '6584219231e0d79763938e7b26590f26dbf2ab3b44a23c5df31cda3c3781fe0b'
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
