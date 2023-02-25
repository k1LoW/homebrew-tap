class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.61.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.61.0/runn_v0.61.0_darwin_arm64.zip'
      sha256 'f7deb7fb728b2dbf96adaf6d65b83a79ccb04c8fcab99f3149c97dd39d50a06b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.61.0/runn_v0.61.0_darwin_amd64.zip'
      sha256 '26b1f926defb461bf48aa38cfaef625f6c8371222886e37ca4ed26fd9da5a162'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.61.0/runn_v0.61.0_linux_amd64.tar.gz'
      sha256 '9da9d471ed296636cfedf6591050349b2f3a912142fff1428bbf9d9689ea8f1b'
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
