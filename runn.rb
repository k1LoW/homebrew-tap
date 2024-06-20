class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.113.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.1/runn_v0.113.1_darwin_arm64.zip'
      sha256 '622ded241a0f4ca281bc1b118318ac330113f58fed51ec69215d11efc1a23008'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.1/runn_v0.113.1_darwin_amd64.zip'
      sha256 'b22756f06e712f5eebff2f1cfb623ecb0fe6910574bbbcc25a7534e6a713253a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.1/runn_v0.113.1_linux_amd64.tar.gz'
      sha256 '32ad1f68fac2de4690eda6a9d3a2fee5e31b1044adbcd439d461763bc473c19a'
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
