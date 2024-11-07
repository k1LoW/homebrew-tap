class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.121.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.121.0/runn_v0.121.0_darwin_arm64.zip'
      sha256 'c057fdc672c46c435aa25ff6ba67f2609c11378896cc5247b3f342c1308ace10'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.121.0/runn_v0.121.0_darwin_amd64.zip'
      sha256 'd3aefee2389423e67be4031d604ab82ff85cca9ef7f0dcd0c40cc0ae8b4459fe'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.121.0/runn_v0.121.0_linux_amd64.tar.gz'
      sha256 '59cb051d4387714ca9175cc6d07dbd176c54fb2a64354a77f684855331081993'
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
