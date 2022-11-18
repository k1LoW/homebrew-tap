class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.49.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.0/runn_v0.49.0_darwin_arm64.zip'
      sha256 '965212f6e1207b2937dcc1363c2284ef71d987a89a37ecad0f8e6786294a623e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.0/runn_v0.49.0_darwin_amd64.zip'
      sha256 '93dbe81c0a282a1f20cfbe9ca9c35c327d32564dc5f6b234097f96230d8a01c2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.0/runn_v0.49.0_linux_amd64.tar.gz'
      sha256 '345d6c607c1670329ef14449a3a9b076d484f2eaeb6df7f351427e7c05899d7e'
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
