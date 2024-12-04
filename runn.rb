class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.122.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.2/runn_v0.122.2_darwin_arm64.zip'
      sha256 '91bdc471855267522dcb3e20b53bc4f5d40a6ae0e67ac92d9def8e76f477e92d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.2/runn_v0.122.2_darwin_amd64.zip'
      sha256 '33c7c142507e81b848f5d243b1251797840b453fbc52b1fc77a2a33eb5f1eed9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.2/runn_v0.122.2_linux_amd64.tar.gz'
      sha256 'c5252eec7419ee3e112f89b0e2962f9e8e362a3ea2df2f2789081b8e016fd96a'
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
