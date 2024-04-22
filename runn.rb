class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.104.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.0/runn_v0.104.0_darwin_arm64.zip'
      sha256 '512f57aec9aab738e8b50d88de26b03ef56c466e8caa8b0ef37b1da8ea4fa99e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.0/runn_v0.104.0_darwin_amd64.zip'
      sha256 'c95b43e814fbfae8fd0f8900ea0ca62be4179183e9b7c525d2aa40273f519fb3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.0/runn_v0.104.0_linux_amd64.tar.gz'
      sha256 '1ea58876c9c5c08ec1edea22d5200048ba19e9b0e4b7fbc7d619baead4c20203'
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
