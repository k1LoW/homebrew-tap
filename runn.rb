class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.78.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.78.0/runn_v0.78.0_darwin_arm64.zip'
      sha256 '020aef5fc506e79ad76a64ab69651ff65dbceb1ce12a819d245e0d856f938fd2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.78.0/runn_v0.78.0_darwin_amd64.zip'
      sha256 '2d3cd88cafbd448e7889f0cf39dcf2cfa79ae040aa2c8a5cffb5c787d3246f8c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.78.0/runn_v0.78.0_linux_amd64.tar.gz'
      sha256 '9e148aa8d021451fa38f2c2ca0e35896baf78e981b8d39917fd96672a6045eb1'
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
