class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.6.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.1/runn_v1.6.1_darwin_arm64.zip'
      sha256 '654a47353a7ba23752ddf5b96f665961d2a16b6bf8922c8387466691b9a112cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.1/runn_v1.6.1_darwin_amd64.zip'
      sha256 '7776c89c236068af12862dde53abfeccd1948556ef846adae8d04c74166fa24f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.6.1/runn_v1.6.1_linux_amd64.tar.gz'
      sha256 'd715696ae767489ae4ffb719d26e49d08a56429e958a740703485afc91588ef2'
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
