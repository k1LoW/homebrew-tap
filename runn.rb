class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.127.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.3/runn_v0.127.3_darwin_arm64.zip'
      sha256 '11c66736003cf4b5839d875d0952d729a1be19b56069b235d5477cc737e989fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.3/runn_v0.127.3_darwin_amd64.zip'
      sha256 '5df1ddbf8c326b0ea6561e6346563b2afcda11733f7c69ee596862e30caa6894'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.3/runn_v0.127.3_linux_amd64.tar.gz'
      sha256 '9bef9ebe26e6a399f09acb20b46217f2be0f7356b63e51167d7f6a22cef65898'
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
