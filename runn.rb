class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.53.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.2/runn_v0.53.2_darwin_arm64.zip'
      sha256 '8ac7799932c8af82b212a52c23b1b659b509cc8f14dea016654ba5b39de41a80'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.2/runn_v0.53.2_darwin_amd64.zip'
      sha256 '136d20623df86a14ae36bf69633a6df672be740196aee705efaae86949106bf2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.2/runn_v0.53.2_linux_amd64.tar.gz'
      sha256 '16deaba06d1a094183fb01e9ae5ad9d0903241ead7cfe7f3d0369a5ca1ea1126'
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
