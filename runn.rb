class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.54.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.3/runn_v0.54.3_darwin_arm64.zip'
      sha256 '7a46d94b4a3a6e81d98324571955fb7280c55d0fee1c90b7069f3ee700d05c6b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.3/runn_v0.54.3_darwin_amd64.zip'
      sha256 '1a806ac7ff013b4516857c72bff8145aad01763367a5d6b0cbec6d02a94f097c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.3/runn_v0.54.3_linux_amd64.tar.gz'
      sha256 'ec0f150c3be60306c454e7323fc1664add54ed89b271993cb4a0ab07aa1e29db'
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
