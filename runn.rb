class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.71.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.71.0/runn_v0.71.0_darwin_arm64.zip'
      sha256 '6846a6e48145b0375d8b0a73c8ae346adeec1497b2f45141134c41ad0198441d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.71.0/runn_v0.71.0_darwin_amd64.zip'
      sha256 'f7801ec6f890d596f303ee5759317e77459c8ba1cbfce22b76f904d3f00dafb2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.71.0/runn_v0.71.0_linux_amd64.tar.gz'
      sha256 '13e16ff50351df30eed5c227237e961b16279f0e8698cb8dfbcfbc2d475f1ca2'
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
