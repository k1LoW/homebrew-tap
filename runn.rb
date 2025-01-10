class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.127.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.0/runn_v0.127.0_darwin_arm64.zip'
      sha256 '165e93a89af718118407c54065d6ee37764fa3e935bd3ff8dd52b1ecb8c11bbd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.0/runn_v0.127.0_darwin_amd64.zip'
      sha256 'e977e74f15bae0d4e106dabfd0471199ec86350120690a05c96b457330ffeaaf'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.0/runn_v0.127.0_linux_amd64.tar.gz'
      sha256 'f428c0fb52224a3342912d5eb5908936dbb768d2cf9afc1620c19a5ebd21842a'
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
