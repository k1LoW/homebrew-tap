class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.91.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.3/runn_v0.91.3_darwin_arm64.zip'
      sha256 '51bc86ccb5727e4ca0634af6783abe54cd664b3353967ea540f3516941746b81'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.3/runn_v0.91.3_darwin_amd64.zip'
      sha256 'aadf2cf1f54c57ebf80288b1780a278bccce475219c3bf3fcc0bd3db0deca43d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.3/runn_v0.91.3_linux_amd64.tar.gz'
      sha256 'ad6d74f185678144cb1cf60aacd9bb231dedd90c5be33584e3923f94739e4c4b'
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
