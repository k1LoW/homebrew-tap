class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.135.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.135.0/runn_v0.135.0_darwin_arm64.zip'
      sha256 'c141fe1cef6f90b28b365a68015c670b873a9d4ff716de0c175c8c68cb495233'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.135.0/runn_v0.135.0_darwin_amd64.zip'
      sha256 '2cb2384367f4082964fa6892400af53c789cd68ce51da2f4d4fe671eb892ba48'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.135.0/runn_v0.135.0_linux_amd64.tar.gz'
      sha256 'a1d233559e27115d2429c82dce0056d74857bac9b7a9b941621fe3f96976c4fe'
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
