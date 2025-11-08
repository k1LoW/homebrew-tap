class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.0.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.0.0/runn_v1.0.0_darwin_arm64.zip'
      sha256 '9ddfa4d458efd02be40a324a351467d1c1bcf5ee64edd9975a1335f5b826ae71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.0.0/runn_v1.0.0_darwin_amd64.zip'
      sha256 '80b450494debb2e4c54cc65c7727e7e1c5262eb8e0148a7aaf196eab7eb136cd'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.0.0/runn_v1.0.0_linux_amd64.tar.gz'
      sha256 'c5194daccb8dfca5980c99b1c9681b6b900a7ba3939783da146ec1175f199e91'
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
