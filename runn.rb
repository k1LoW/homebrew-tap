class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.110.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.110.0/runn_v0.110.0_darwin_arm64.zip'
      sha256 '80e153b134fcadda12c307d710ec57807603b2699e263ef8773f0a9a29c4d464'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.110.0/runn_v0.110.0_darwin_amd64.zip'
      sha256 '2646e1376f969c6a76d513b40f842bd579ff558b1bcf1787508d3afda98c3d7e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.110.0/runn_v0.110.0_linux_amd64.tar.gz'
      sha256 'f35864be0c1a209752fdce9255085f3d01c85eaba021345cfbca8c66ff035a24'
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
