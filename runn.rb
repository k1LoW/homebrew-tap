class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.57.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.1/runn_v0.57.1_darwin_arm64.zip'
      sha256 'db466549583a6d191e3a23fd587c1e72712d43ed886131781e60891abad0d643'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.1/runn_v0.57.1_darwin_amd64.zip'
      sha256 'f49787a1ad474d818e7a55b9175df984c4660021bf6506aa765d39c0b31534be'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.1/runn_v0.57.1_linux_amd64.tar.gz'
      sha256 '587499eec49197502cf488a5b38132533e9abba4d5a297f3633f1527565ef6a1'
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
