class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.99.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.4/runn_v0.99.4_darwin_arm64.zip'
      sha256 '82a0d68b41162f07d4d3e88d0f37b49fe837b57ce2ba499ddde15f4bbb1e576f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.4/runn_v0.99.4_darwin_amd64.zip'
      sha256 '20a794d3a631a5cfe206de81c60622685a8263edaa8274e94591ac99c7af15c9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.4/runn_v0.99.4_linux_amd64.tar.gz'
      sha256 'a6ed1f7f2d99b3a32e81cf33a3f48a574fa9bff71b8cad769474ed85b25be797'
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
