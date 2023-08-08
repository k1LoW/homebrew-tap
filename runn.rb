class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.80.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.0/runn_v0.80.0_darwin_arm64.zip'
      sha256 '875e7234161921194fc02118926ddaf2f426e4642a49f50d5c336de06740cd84'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.0/runn_v0.80.0_darwin_amd64.zip'
      sha256 'eb64b1c51876a561c74e4fba306abd835071032a81e4a3ae8d1b9a15226c541e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.0/runn_v0.80.0_linux_amd64.tar.gz'
      sha256 'a1a6b6353d59f8c8879b66fda0014e94511e284b3575881cbcbee54be36f0cb7'
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
