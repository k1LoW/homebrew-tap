class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.140.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.4/runn_v0.140.4_darwin_arm64.zip'
      sha256 'ac6df3f7fbdd7c7afa4855833ddad7854f60a4c75188d084517e386bd1da3252'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.4/runn_v0.140.4_darwin_amd64.zip'
      sha256 '74a0ddd29ff79a15d943b4968ec8204bae771f9c59f499e5d50e4974adaefa4c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.4/runn_v0.140.4_linux_amd64.tar.gz'
      sha256 '3afd599061035fb49c11906190da61923cc68ac26bea59bbe33ac6feb8b579a8'
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
