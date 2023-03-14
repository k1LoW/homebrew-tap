class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.64.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.64.1/runn_v0.64.1_darwin_arm64.zip'
      sha256 '1a792b384d065235cd0e5c46455dcf257ceeb54af2045cb7331dd62b9ebe6095'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.64.1/runn_v0.64.1_darwin_amd64.zip'
      sha256 'b563a65b2aac7b28ede6326cacb6a854ce350129de2a47d99bd0a164e79f52c5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.64.1/runn_v0.64.1_linux_amd64.tar.gz'
      sha256 '971a5b55f4654ea59fb162cb15a6c3e071ea48305a31b27e42da493b1b790927'
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
