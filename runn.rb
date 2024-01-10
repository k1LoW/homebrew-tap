class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.94.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.94.1/runn_v0.94.1_darwin_arm64.zip'
      sha256 '6318737ee09a4c1d76832b070fb3134b3a88139a4d19b36c45b62012955d25c1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.94.1/runn_v0.94.1_darwin_amd64.zip'
      sha256 '2e166f74de14e283ac3411011bdc3b46dfd0afefaa32e0671ea3631444629460'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.94.1/runn_v0.94.1_linux_amd64.tar.gz'
      sha256 '7921e935dd67c73d3048b23ddbeb5d3dcb34a5efbd34b82394efd85eb3f5a696'
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
