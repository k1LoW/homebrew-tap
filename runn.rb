class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.39.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.39.0/runn_v0.39.0_darwin_arm64.zip'
      sha256 '93f42d9e0ec2b61167d8cc2525badb52f09bad50e315508008be70f958d02929'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.39.0/runn_v0.39.0_darwin_amd64.zip'
      sha256 '7377bb8db9a0d64964ef355798fc871ff86d88ab7926be157a4cff0304fbb52e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.39.0/runn_v0.39.0_linux_amd64.tar.gz'
      sha256 '837850b5bf3d72869a44a26f7495f4f2656449763e92219333a5b7e819b462ef'
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
