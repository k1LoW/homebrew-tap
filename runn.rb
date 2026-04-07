class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.8.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.1/runn_v1.8.1_darwin_arm64.zip'
      sha256 'af488ffcf87acce7913f25b32ef82f910a08bd0b17757218fda62d7fc7032892'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.1/runn_v1.8.1_darwin_amd64.zip'
      sha256 '7c94755ad80cff9fec3c47b8e1e862dc0b9a22993c064f9b2693bc5687cd1d4d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.1/runn_v1.8.1_linux_amd64.tar.gz'
      sha256 '90bd0f75b288cd0a176224eaebf9b4ae289c782bfb01c3bd89ad4e2588a1b319'
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
