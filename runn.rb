class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.52.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.0/runn_v0.52.0_darwin_arm64.zip'
      sha256 'f777d8b63be13d51e493eb1f002516c2d079b4d62ee46d21372dafe019518ce4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.0/runn_v0.52.0_darwin_amd64.zip'
      sha256 '7bbc37c9a913a5474d987a7c9ae81abf555dffe5d4713bc2dc77c00fe2cbb307'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.0/runn_v0.52.0_linux_amd64.tar.gz'
      sha256 'e8c2ee1d87f2ae10b4502819160908dce4a38e59498875eda818f5145e32ad0d'
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
