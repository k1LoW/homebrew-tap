class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.54.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.1/runn_v0.54.1_darwin_arm64.zip'
      sha256 '5c6c1962bbade111ae82daf4ced29044c86a15e9fe24f23658d41fc50c54a5fa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.1/runn_v0.54.1_darwin_amd64.zip'
      sha256 '1371b5eb3fd24928b917b0692edf7a4ae7518346785415064a097d79d6794734'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.54.1/runn_v0.54.1_linux_amd64.tar.gz'
      sha256 '1bc5a6e46a6d216961d97e7b68010203315e75dd311b01a1c918b238a8b682d3'
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
