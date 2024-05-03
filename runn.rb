class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.106.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.106.0/runn_v0.106.0_darwin_arm64.zip'
      sha256 '1f26d32e1096c0c9378d4fc46eac6672024c80b68f7aef77b65901985c4e88b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.106.0/runn_v0.106.0_darwin_amd64.zip'
      sha256 '72688ad78c22a2f44181b1d2559ce6406c9abdf5c73b30ec67b7043bd09ef328'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.106.0/runn_v0.106.0_linux_amd64.tar.gz'
      sha256 'cb1ba0c043a37acb053269b52ad0324618517f75606787c7f2ca21b1fe2dd8ad'
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
