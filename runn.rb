class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.52.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.3/runn_v0.52.3_darwin_arm64.zip'
      sha256 '511490eaf23bf9d14903a00b7242c038394ca95c4dcce4549d76c2b6886031bf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.3/runn_v0.52.3_darwin_amd64.zip'
      sha256 '2011a97919c8779c0e298ee39131c6f4bfd507161eae2e77dc413360aef5b59a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.3/runn_v0.52.3_linux_amd64.tar.gz'
      sha256 '087c0de82b47ebd7493605ff3af76a94e4a603656ab3c28683b800fec9480a63'
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
