class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.47.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.2/runn_v0.47.2_darwin_arm64.zip'
      sha256 '3282fa9f545dc0508d1a8d60ab36cbd303d724cea50763300d82b252f9cf3c94'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.2/runn_v0.47.2_darwin_amd64.zip'
      sha256 '47f23b33c9731fd015aac381040bf94406aea96a99aedb373be962291195e868'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.2/runn_v0.47.2_linux_amd64.tar.gz'
      sha256 'bcc7eee5d3ee07d43ac41b0e30cb26357d7622d59ccf133ba6e3f8e65287bd93'
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
