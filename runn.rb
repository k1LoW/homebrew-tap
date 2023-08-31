class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.82.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.82.0/runn_v0.82.0_darwin_arm64.zip'
      sha256 '7eeb0751be32dbe19b3763d2184fd77d8471cefe7f3bb1345edd01e5b1a9b942'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.82.0/runn_v0.82.0_darwin_amd64.zip'
      sha256 '18422f180460812ce0f384d3ec5bece9ffb0b1dc64573144d16481699a28d343'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.82.0/runn_v0.82.0_linux_amd64.tar.gz'
      sha256 '3c1f01d00a04ab71cf8105dfc282bb9c2f4ea0b7b9a1b3ed846450dedc45cca6'
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
