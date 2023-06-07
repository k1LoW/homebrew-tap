class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.74.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.74.1/runn_v0.74.1_darwin_arm64.zip'
      sha256 'f386afac5d0962f523bff81f048ccb85af763da92405a9cd32816d81dc41ee9a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.74.1/runn_v0.74.1_darwin_amd64.zip'
      sha256 'a3f922ea08d2ea4989b39a8755b562a7c54eedb2fefe22c8913274eaa48903df'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.74.1/runn_v0.74.1_linux_amd64.tar.gz'
      sha256 'cbad1bf1fa93f67c65d52afef78db9461cfba7692152782f8bda6e57d483ad91'
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
