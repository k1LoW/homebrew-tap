class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.126.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.126.1/runn_v0.126.1_darwin_arm64.zip'
      sha256 '4a6891f32ebb3dc32b96f80c89e9519ca14e69d688b21289fcf6280066816ad8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.126.1/runn_v0.126.1_darwin_amd64.zip'
      sha256 '904fbeb15d4d3a123c3ef2f39d9f6fb12328285b5904504f85c309fc0696962b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.126.1/runn_v0.126.1_linux_amd64.tar.gz'
      sha256 'e82297c27b8457fd9e704e8b372cdd5b913124f2b1db570ceeb15ffbeee07a70'
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
