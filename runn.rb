class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.54.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.2/runn_v0.54.2_darwin_arm64.zip'
      sha256 'd45594b92d74969b29cc87c339f2d58c71df7989e6f437bb78e83285c3641def'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.2/runn_v0.54.2_darwin_amd64.zip'
      sha256 '188f7e5410c69c7fa6173c36fa27aa7c9b03736e30ff3595927fcfbe286e01c5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.2/runn_v0.54.2_linux_amd64.tar.gz'
      sha256 '8794f9347bb19e7462c2e8571844543387df843c4e722cc259f83baf56d4f92c'
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
