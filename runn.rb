class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.90.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.4/runn_v0.90.4_darwin_arm64.zip'
      sha256 'd356870c54346d9e3d02815b625f6e96b6b89935c51a345d57852c81873d1ff9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.4/runn_v0.90.4_darwin_amd64.zip'
      sha256 'c45e082cfe04f284ec2eac63c92af6808819c60ed08f4a59c6cb17e16e3f6de8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.4/runn_v0.90.4_linux_amd64.tar.gz'
      sha256 '698efeacb1f5bdbd14d34438c4de7dcacfb9f5b2147c6a9d5935541d0136325d'
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
