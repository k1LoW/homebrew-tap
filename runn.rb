class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.53.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.0/runn_v0.53.0_darwin_arm64.zip'
      sha256 '5c58a7089a30b43c4fac4d6d3a9740a223146e976ae7036e73119f6306fe9544'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.0/runn_v0.53.0_darwin_amd64.zip'
      sha256 'ee97e6c93d2b6c82e40ff32092b40f45b14c8e0e291e8eeb644f1d23e0f1bfb1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.0/runn_v0.53.0_linux_amd64.tar.gz'
      sha256 '0d9e0b2b54dc6e6896f4602517fd8489f7b434a76554bc0c172def44dab0b7d3'
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
