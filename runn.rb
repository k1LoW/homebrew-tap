class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.56.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.56.0/runn_v0.56.0_darwin_arm64.zip'
      sha256 '888268c2dac202cb61c801e91ae516a70bd4598a6deb0d5cba809e0d685967d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.56.0/runn_v0.56.0_darwin_amd64.zip'
      sha256 '1499c86cb4cf8c6a9b4ec95e04c05c97a054a7c7b50a3b887d257042b12039f8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.56.0/runn_v0.56.0_linux_amd64.tar.gz'
      sha256 '66a0c22afd554d8109c749da97e26c0f49043a9d421e462bc2bb93c0195c2be5'
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
