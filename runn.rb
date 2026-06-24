class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.9.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.3/runn_v1.9.3_darwin_arm64.zip'
      sha256 '1df7daccdc3fb766a3120c6194b208edb3541e6f061e93bb5775bd8be42b8d26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.3/runn_v1.9.3_darwin_amd64.zip'
      sha256 'a8afd2c0e4340f462fd47f48a018027049bf9317b7a120888e9da1aefd008a29'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.3/runn_v1.9.3_linux_amd64.tar.gz'
      sha256 '86d8cf9a38d074c9c0fb36b516cb71d9013b6cb137718e2ea70757e710c11064'
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
