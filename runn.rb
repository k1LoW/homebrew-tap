class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.101.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.2/runn_v0.101.2_darwin_arm64.zip'
      sha256 '18bff958bcc637ea51df1a2ead74d5fcee12c8954bc16ef1ede5c0e4dccb0a91'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.2/runn_v0.101.2_darwin_amd64.zip'
      sha256 '121a82b5f66c31d7e5cb8e3cb60dee99ad72741eeeb69369c24fea1c862010b5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.2/runn_v0.101.2_linux_amd64.tar.gz'
      sha256 '25d41c4bf29f4e84cd50464add48143e4a5da3886ca916419535a4bc8d2f6f4e'
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
