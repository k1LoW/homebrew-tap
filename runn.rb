class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.139.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.139.1/runn_v0.139.1_darwin_arm64.zip'
      sha256 '575c31951b11658dd43c690ccfd36701f41f01a068c06f8b94facdc3b0586f20'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.139.1/runn_v0.139.1_darwin_amd64.zip'
      sha256 'aaee4ed58ccda5749d68565cb2329615db1f411ae54e8636c9be289f78b21f8f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.139.1/runn_v0.139.1_linux_amd64.tar.gz'
      sha256 '3deaf8702633becaa6db23d227e09d91620b17e18a0af06ecc49f60ed3b94f7a'
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
