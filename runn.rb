class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.75.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.3/runn_v0.75.3_darwin_arm64.zip'
      sha256 'ec649d6b46fa883d7f6eda97737c7ea5f22ec593c56d8b88b2e823ab8f49b86c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.3/runn_v0.75.3_darwin_amd64.zip'
      sha256 'd565c6b5c4c1c4bbe94956a197ca2fe72db87ab56bd10444ea857e6d2849adaa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.3/runn_v0.75.3_linux_amd64.tar.gz'
      sha256 'cd2d93f00cddca865a555427f119ea90ea00d7583dcb3f206b798b5e7b7bc830'
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
