class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.4.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.4.0/runn_v1.4.0_darwin_arm64.zip'
      sha256 'c2ddfb2fd956bd0538f7e02b3002283254e4bf2dadd185e95b90043c84f139d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.4.0/runn_v1.4.0_darwin_amd64.zip'
      sha256 '4557c1b10fe68ebb4ce402f856415fe12eb82fc8934d5f88c87d7c4a71aff0e7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.4.0/runn_v1.4.0_linux_amd64.tar.gz'
      sha256 '00ce46faeff1a4813d7bf61fa900be045b5057a9ff5b3106693077bf8e04d5f0'
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
