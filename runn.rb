class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.136.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.136.0/runn_v0.136.0_darwin_arm64.zip'
      sha256 '043bd1436c4b360e5dff85f11e61ea579c832d59c8189199e134792736f92b24'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.136.0/runn_v0.136.0_darwin_amd64.zip'
      sha256 '52dc4037f56f37825797eef9e066c49b94f04a524f2e6d2a9b1f34cbd4353e8a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.136.0/runn_v0.136.0_linux_amd64.tar.gz'
      sha256 'bbbbf076a12445ff8102ac459fc31060e9e5fbe2ea81dfe781d54dd5a2f97545'
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
