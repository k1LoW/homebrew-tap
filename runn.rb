class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.50.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.50.0/runn_v0.50.0_darwin_arm64.zip'
      sha256 '0e4fa990755ab73dd3e1aae3ae9aabe22d50258b9d85fb60fc633b0beea6dd2f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.50.0/runn_v0.50.0_darwin_amd64.zip'
      sha256 '1dd0b278215f3e728e3680e96cea08f8de70f1df49f41efdb8da418553d8ea68'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.50.0/runn_v0.50.0_linux_amd64.tar.gz'
      sha256 'a018333abebea89808f6e517c8c0b1780a9fd9a3704391570c6798f1aa5206fd'
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
