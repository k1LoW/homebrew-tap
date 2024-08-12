class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.116.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.3/runn_v0.116.3_darwin_arm64.zip'
      sha256 'ddf4097f13b72dadb646acea8065037ed570bf8ba77e78b739ea295b75c4c980'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.3/runn_v0.116.3_darwin_amd64.zip'
      sha256 '1f9c973c7be9596c7af9b6768e2e58113b56196dd07a27d7dd27a18c8f97fc61'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.3/runn_v0.116.3_linux_amd64.tar.gz'
      sha256 '28f6180560e0458d8835b8910e79b1cbfb6218a5a38adea9fd5049eb27e9f54e'
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
