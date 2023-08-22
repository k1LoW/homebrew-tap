class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.81.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.81.0/runn_v0.81.0_darwin_arm64.zip'
      sha256 'e1479acbbf15b6d8a944557517cea295888e21400be6386aff23ad2c3e3ad8ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.81.0/runn_v0.81.0_darwin_amd64.zip'
      sha256 'd126daf7a8e5ae7d21c8bd7dff5cc206492a71d116ce2791f4c95f9fafbfb576'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.81.0/runn_v0.81.0_linux_amd64.tar.gz'
      sha256 '6f69f49b87d10c42161020f5ba15ceb823eca899c52d6fb42b3b7b9e265416d6'
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
