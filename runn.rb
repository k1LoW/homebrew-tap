class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.65.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.65.0/runn_v0.65.0_darwin_arm64.zip'
      sha256 '484f609d315554ad90bc5c58020db5506f5866461664baa557674a8af5cad902'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.65.0/runn_v0.65.0_darwin_amd64.zip'
      sha256 'ac6ea36bcd33331221597df0b118898746d18d0d4c846bd86c2dae9f2f4dd12d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.65.0/runn_v0.65.0_linux_amd64.tar.gz'
      sha256 'e5ccc5fb747efb9251dd671420d23c35a867d9f38b66bd7ee9f955fc5bd0ebe8'
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
