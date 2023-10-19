class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.86.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.86.0/runn_v0.86.0_darwin_arm64.zip'
      sha256 '4ad64ba51749716806d9bc0b8af079fbe2fd3e88295c059c3617b86b6d3eab0c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.86.0/runn_v0.86.0_darwin_amd64.zip'
      sha256 'e60b5794e83e242215f940c02260ac630a3add534e09dfaa99488f52f878e01e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.86.0/runn_v0.86.0_linux_amd64.tar.gz'
      sha256 '5ab3980215d90243a58bf6a0ed2295f2814193144661e2d5ff58d3294d8f5c61'
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
