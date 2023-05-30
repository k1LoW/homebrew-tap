class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.73.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.73.0/runn_v0.73.0_darwin_arm64.zip'
      sha256 'c2161a64c77408febf728a77a2004ae08614e34abfa7a4c503754df4ac0933a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.73.0/runn_v0.73.0_darwin_amd64.zip'
      sha256 '4d9844cdab9be914625b56de95f4d75ebdbcf5bb87385c04fb676a0b37a975bc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.73.0/runn_v0.73.0_linux_amd64.tar.gz'
      sha256 '6b86760b7d55566d9d5e7645edced3766a0d751076b9b1ac36f6edb2e1df4a79'
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
