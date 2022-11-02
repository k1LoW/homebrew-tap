class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.46.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.46.0/runn_v0.46.0_darwin_arm64.zip'
      sha256 '89b7dad88e821062c2580eea40d70bbc3f5048332a0d444eac2f78e628bed0dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.46.0/runn_v0.46.0_darwin_amd64.zip'
      sha256 'd7a0cdcaefae6942ecba004452ee2bd12ea4a6d5310728cea2e33c53cdd01345'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.46.0/runn_v0.46.0_linux_amd64.tar.gz'
      sha256 'd73f9da8542eb7cec059b971c019ee06cc6459a2997784827d38928905f93294'
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
