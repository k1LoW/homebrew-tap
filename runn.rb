class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.84.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.84.2/runn_v0.84.2_darwin_arm64.zip'
      sha256 'a47afecf86a5c31aad5a558f0fe98e8706e7b3846b27b924ce3c63ecbe2704c9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.84.2/runn_v0.84.2_darwin_amd64.zip'
      sha256 '67d9e21de86129a19d75d7478d091b5ca68dce8815ba636cb65b58b1c01d75b8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.84.2/runn_v0.84.2_linux_amd64.tar.gz'
      sha256 'a914a4feb40542a92419132f0db760d95df6cc925ad1a208c4558851613ce4b1'
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
