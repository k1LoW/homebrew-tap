class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.124.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.124.1/runn_v0.124.1_darwin_arm64.zip'
      sha256 '85055876fb7a17162801ff1db437fc6de586fea5ebe14f21e0cc61c8dd0ca4ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.124.1/runn_v0.124.1_darwin_amd64.zip'
      sha256 'ff159437536b8df61be834a11f339c3a7968a0491ac338fe488145f3a6646d26'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.124.1/runn_v0.124.1_linux_amd64.tar.gz'
      sha256 'ffb9c6044e296aa9e32220ce32b3cb1993f4949ef5b34489d3f599d82a2e76bf'
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
