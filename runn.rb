class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.112.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.2/runn_v0.112.2_darwin_arm64.zip'
      sha256 'a60c4ff7205951487297f943380f902c4ae5541b1c0c2a8f325e9816f854f8d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.2/runn_v0.112.2_darwin_amd64.zip'
      sha256 'fc429fb4de38ab21e23ba64e01d32e4605faa9cb2ab4cd2bd9183fab4d43210e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.112.2/runn_v0.112.2_linux_amd64.tar.gz'
      sha256 'af7ca1141b552390c24ceba860de08aa3ef61bf745eccc32bc4dfe7c010d8d6e'
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
