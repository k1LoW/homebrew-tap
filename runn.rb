class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.129.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.0/runn_v0.129.0_darwin_arm64.zip'
      sha256 'eb130924796c7f5daaa699b333f4ee07b6aed05c940bb2bb813cd6f346d9d6ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.0/runn_v0.129.0_darwin_amd64.zip'
      sha256 '4db3b7276212b98671805978993326d35d86e50d9e86f7ee8f64840e09be4d65'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.0/runn_v0.129.0_linux_amd64.tar.gz'
      sha256 '0aecd1c6ff8689a270b1403a78cfde30214bc00452ccb8e5c929a7133ed9ce53'
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
