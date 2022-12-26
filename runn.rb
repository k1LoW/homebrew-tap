class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.54.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.4/runn_v0.54.4_darwin_arm64.zip'
      sha256 'bcdf71ba6ce5a58f16e61abbdb493eb56c9ab3029b31b4176b93928f02f53ac5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.4/runn_v0.54.4_darwin_amd64.zip'
      sha256 'a6a18557d747649f5ed6157aad2d5b975252e14b814c4ff247ffab63a75d9ec7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.4/runn_v0.54.4_linux_amd64.tar.gz'
      sha256 '4a170c517d60e90ec8b862caadce0bc0996d4fa57436fabaa2ff82ae0e92c47f'
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
