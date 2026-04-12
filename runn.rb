class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.9.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.0/runn_v1.9.0_darwin_arm64.zip'
      sha256 '56bcd6bd3758c8a0a4b552e87572d6f6babb21dd18e0b8a746246c266c7965d2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.0/runn_v1.9.0_darwin_amd64.zip'
      sha256 'ac0d422e361cfef877c04d71cbf905582df374f69f0121b3ee8db7cf9dcdcbbc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.9.0/runn_v1.9.0_linux_amd64.tar.gz'
      sha256 '252ba3484b57dc32ec00e74951e42328dc401585ca2d549f2db0b83bc18f8784'
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
