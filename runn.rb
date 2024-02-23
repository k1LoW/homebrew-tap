class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.99.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.3/runn_v0.99.3_darwin_arm64.zip'
      sha256 '504c8db29a6f174773fb0b8792fd2dc4933183e091c003735178b5a8c538183b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.3/runn_v0.99.3_darwin_amd64.zip'
      sha256 'e3a0ec0db42ba8d6285b685dbb401f6f932324081031b13d95c32d4dcc36e9b9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.3/runn_v0.99.3_linux_amd64.tar.gz'
      sha256 '8fe5cad45f8eb22d1f6e790f1b4e60dff6525602705a8df54815ecb6f52409ed'
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
