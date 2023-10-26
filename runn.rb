class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.88.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.88.0/runn_v0.88.0_darwin_arm64.zip'
      sha256 '37d87fd46088f80e78fc294d8e389a9b80e349a1d330c94ba2f12cd4167486c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.88.0/runn_v0.88.0_darwin_amd64.zip'
      sha256 'c50179123c83a99d4303f490e87b7bded6ba88db93856a4d895884adb04957e9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.88.0/runn_v0.88.0_linux_amd64.tar.gz'
      sha256 '0d3037d4242c293d7f38fdf22fb67aa1844b49936c71a0fab37b0c16c76e95e7'
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
