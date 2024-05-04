class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.107.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.0/runn_v0.107.0_darwin_arm64.zip'
      sha256 '2b0c9d7cf97fa989b1d142c8a77b37fe2484ce6621d55b0ccfafdab709301842'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.0/runn_v0.107.0_darwin_amd64.zip'
      sha256 'd3fe2d3d591d0599ab036f30dc35bb3060c703c8c910a7e83ac63efee9a44669'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.0/runn_v0.107.0_linux_amd64.tar.gz'
      sha256 '4650d9c209c0e31b0b8b6b0ddfad528fc49c21a2e8e6e083af5d75c357594a69'
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
