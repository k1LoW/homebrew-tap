class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.67.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.67.0/runn_v0.67.0_darwin_arm64.zip'
      sha256 'b2420dc8831555467e6bd2672815d8b42550febaf855b723447ffe2b9e6baac9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.67.0/runn_v0.67.0_darwin_amd64.zip'
      sha256 '1759312746198341b4232a13e4d13f17e4885e3b987cac384b65fd5486aee0f5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.67.0/runn_v0.67.0_linux_amd64.tar.gz'
      sha256 '6667bd85f792a28cc5be1eb8f6f1f7fc00eab1c1a9e563bfa25fc02454b42660'
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
