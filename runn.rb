class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.114.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.114.0/runn_v0.114.0_darwin_arm64.zip'
      sha256 'a6a880018e2e9e0398459c28d886ebfe0027d558dd901f03847e18e706224da7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.114.0/runn_v0.114.0_darwin_amd64.zip'
      sha256 'e24ff61148a46605778fa08a2a3cf68b6561e828fee4132216ac23703977a40f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.114.0/runn_v0.114.0_linux_amd64.tar.gz'
      sha256 'e89899cd40ae3eb686a3bf10fbeae99ad52ccc8892e125205e66712c8b661c86'
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
