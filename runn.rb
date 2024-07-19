class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.115.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.0/runn_v0.115.0_darwin_arm64.zip'
      sha256 'a253000f3fdeacc4e66314cdd0b1edd0b513233bed602c4c9568b46422c404d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.0/runn_v0.115.0_darwin_amd64.zip'
      sha256 'bbc0fbe697d1a26b25c2fd62034b8db31c7369d66dd7121db3b2843f88506bc9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.0/runn_v0.115.0_linux_amd64.tar.gz'
      sha256 '36a93fc75a2eb03fd7925da2dfa32719aa6622ee151b8eac035958d83817403f'
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
