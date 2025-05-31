class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.131.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.131.0/runn_v0.131.0_darwin_arm64.zip'
      sha256 '12a15cb075677cae25b6eb28051f0671d4782e81e030fd66fbcf4d16411bbaa9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.131.0/runn_v0.131.0_darwin_amd64.zip'
      sha256 '4c8c9211f49aa5180289e4e0fdecfcfe59a41baefef98378c04abc5afb163e6f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.131.0/runn_v0.131.0_linux_amd64.tar.gz'
      sha256 'de2dec2cad043b05914facb36aa7bd78d62a2203ce5a2365afb0a6ea989fa6b2'
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
