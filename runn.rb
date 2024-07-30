class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.115.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.1/runn_v0.115.1_darwin_arm64.zip'
      sha256 '9088ea0a4a4ad1e5d8a646a7350b1951e64eaeb4950399114b45c8a243dc89c9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.1/runn_v0.115.1_darwin_amd64.zip'
      sha256 'b9202771d8eae71288374860787ba11fd9f271398bfc67f84e31936b0c0f12a6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.115.1/runn_v0.115.1_linux_amd64.tar.gz'
      sha256 'fc7f0d6d6bde70011b8eb625ea20e4e0a529e02a0d4105db45ba4dbc5e72c593'
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
