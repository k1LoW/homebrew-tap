class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.91.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.2/runn_v0.91.2_darwin_arm64.zip'
      sha256 'ec6d382c4f311c4bc6d987baad440f8faa9d8c5a03de383b6e839daaf7fd51be'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.2/runn_v0.91.2_darwin_amd64.zip'
      sha256 'ecc7801088b5d73ecb5bd8e58517fe8c720dfe8ef8c8f732b8800d2edbe63ad4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.2/runn_v0.91.2_linux_amd64.tar.gz'
      sha256 'fcecac80859e52e7dd5026b9617dd5221c939cffc37e32506b69efe7b7524049'
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
