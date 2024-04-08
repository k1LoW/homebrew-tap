class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.101.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.4/runn_v0.101.4_darwin_arm64.zip'
      sha256 '67fb6b430d68b670f3f997b2c615602a246f97abe82e6cbec97ff75aaefd6576'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.4/runn_v0.101.4_darwin_amd64.zip'
      sha256 '14fb149aac9f8daf1d63cc3b330ca6f36d73f5728c0c7d79abcb6a886b175b19'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.4/runn_v0.101.4_linux_amd64.tar.gz'
      sha256 '4e0d1edcf23c326c480e6514dabf2f17353aac467ba0007d89e0245f2a871db8'
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
